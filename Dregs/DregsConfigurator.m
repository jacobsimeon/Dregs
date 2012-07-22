//
//  DregsConfigurator.m
//  Bolst
//
//  Created by Jacob Morris on 6/14/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "DregsConfigurator.h"

@interface DregsConfigurator(Private)
- (void) registerResource:(DregsResourceConfiguration *)resource;
- (void) registerResourceMappings:(DregsResourceConfiguration *)resource;
- (void) registerResourceRoutes:(DregsResourceConfiguration *)resource;
@end

@implementation DregsConfigurator

@synthesize manager;

+ (DregsConfigurator *) configurator{
  return [[DregsConfigurator alloc]init];
}

- (void) resource:(void (^)(DregsResourceConfiguration *))configureResource{
  DregsResourceConfiguration *resource = [[DregsResourceConfiguration alloc] init];
  configureResource(resource);
  [self registerResource:resource];
}

- (void)registerResource:(DregsResourceConfiguration *)resource{
  [self registerResourceMappings:resource];
  [self registerResourceRoutes:resource];
}

- (void)registerResourceMappings:(DregsResourceConfiguration *)resource{
  RKObjectMappingProvider *mapper = self.manager.mappingProvider;
  [mapper setMapping:resource.mapping forKeyPath:resource.rootKey];
  [mapper setSerializationMapping:resource.serializationMapping forClass:resource.resourceClass];  
}

- (void)registerResourceRoutes:(DregsResourceConfiguration *)resource{  
  RKObjectRouter *router = self.manager.router;
  DregsRoutingConfiguration *routes = resource.routes;
  NSString *path;
  
  Class _class = resource.resourceClass;
  
  if((path = routes.read)){
    [router routeClass:_class toResourcePath:path forMethod:RKRequestMethodGET];
  }
  if((path = routes.create)){
    [router routeClass:_class toResourcePath:path forMethod:RKRequestMethodPOST];
  }
  if((path = routes.update)){
    [router routeClass:_class toResourcePath:path forMethod:RKRequestMethodPUT];
  }
  if((path = routes.destroy)){
    [router routeClass:_class toResourcePath:path forMethod:RKRequestMethodDELETE];
  }
}


@end

