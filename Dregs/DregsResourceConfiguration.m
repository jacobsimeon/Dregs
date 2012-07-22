//
//  DregsObjectConfiguration.m
//  Bolst
//
//  Created by Jacob Morris on 6/14/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "DregsResourceConfiguration.h"
@interface DregsResourceConfiguration(Private)
- (RKObjectMapping *)mappingWithBlock:(void (^)(RKObjectMapping *))mappingBlock;
@end

@implementation DregsResourceConfiguration
@synthesize resourceClass, mapping, serializationMapping, rootKey, routes;

- (void)map:(void (^)(RKObjectMapping *))mappingBlock{
  self.mapping = [self mappingWithBlock:mappingBlock];
}

- (void)mapSerialization:(void (^)(RKObjectMapping *))mappingBlock{
  self.serializationMapping = [self mappingWithBlock:mappingBlock];
}

- (RKObjectMapping *)mappingWithBlock:(void (^)(RKObjectMapping *))mappingBlock{
  return [RKObjectMapping mappingForClass:self.resourceClass usingBlock:mappingBlock];
}

- (void)route:(void (^)(DregsRoutingConfiguration *))configureRoutes{
  self.routes = [[DregsRoutingConfiguration alloc]init];
  configureRoutes(routes);
}

@end
