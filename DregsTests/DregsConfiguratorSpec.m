#import "DregsSpecHelper.h"

SPEC_BEGIN(DregsConfiguratorSpec)

describe(@"DregsConfigurator", ^{
  context(@"configured for DreggableTask", ^{
    
    NSString *baseUrl = @"http://localhost:4567";
    RKObjectManager *manager = [RKObjectManager managerWithBaseURLString:baseUrl];
    
    DregsConfigurator *configure = [[DregsConfigurator alloc]init];
    configure.manager = manager;
    
    //Task Configuration
    __block DregsResourceConfiguration *resourceConfiguration;
    [configure resource:^(DregsResourceConfiguration *resource){
      
      resourceConfiguration = resource;
      
      resource.resourceClass = [DreggableTask class];
      resource.rootKey = @"task";
      [resource route:^(DregsRoutingConfiguration *route) {
        route.create = @"/tasks";
        route.read = @"/tasks/:id";
        route.update = @"/tasks/:id";
        route.destroy = @"/tasks/:id";
      }];
      
      [resource map:^(RKObjectMapping *mapping) {
        [mapping mapAttributes:@"description", nil];
      }];
      
      [resource mapSerialization:^(RKObjectMapping *mapping) {
        [mapping mapAttributes:@"description", nil];
      }];
      
    }];

    RKObjectMappingProvider *mapper = manager.mappingProvider;
    RKObjectRouter *router = manager.router;

    DreggableTask *task = [[DreggableTask alloc]init];
    task.id = [NSNumber numberWithInt:25];
    
    it(@"registers the mapping", ^{
      RKObjectMapping *registeredMapping = (RKObjectMapping *)[mapper mappingForKeyPath:@"task"];
      [[registeredMapping should] equal:resourceConfiguration.mapping];
    });
    
    it(@"registers the serialization mapping", ^{
      RKObjectMapping *registeredSerializationMapping = [mapper serializationMappingForClass:[DreggableTask class]];
      [[registeredSerializationMapping should] equal:resourceConfiguration.serializationMapping];
    });
    
    it(@"registers the GET route", ^{
      NSString *getRoute = [router resourcePathForObject:task method:RKRequestMethodGET];
      [[getRoute should] equal:@"/tasks/25"];
    });
    
    it(@"registers the POST route", ^{
      NSString *postRoute = [router resourcePathForObject:task method:RKRequestMethodPOST];
      [[postRoute should] equal:@"/tasks"];
    });
    
    it(@"registers the PUT route", ^{
      NSString *putRoute = [router resourcePathForObject:task method:RKRequestMethodPUT];
      [[putRoute should] equal:@"/tasks/25"];
    });
    
    it(@"registers the DELETE route", ^{
      NSString *deleteRoute = [router resourcePathForObject:task method:RKRequestMethodDELETE];
      [[deleteRoute should] equal:@"/tasks/25"];
    });
    
    
  });
  
});

SPEC_END
