#import "DregsSpecHelper.h"

SPEC_BEGIN(DregsResourceConfigurationSpec)

describe(@"DregsResourceConfiguration", ^{
  __block DregsResourceConfiguration *resource;
  
  beforeEach(^{
    resource = [[DregsResourceConfiguration alloc]init];
  });

  context(@"configured with DreggableTask as resourceClass", ^{

    beforeEach(^{
      resource.resourceClass = [DreggableTask class];
    });

    it(@"sets the resourceClass", ^{
      [[resource.resourceClass should] equal:[DreggableTask class]];
    });
    
    context(@"and has configured a mapping", ^{
      __block RKObjectMapping *constructedMapping = nil;
      
      beforeEach(^{
        [resource map:^(RKObjectMapping *mapping){
          constructedMapping = mapping;
        }];
      });
      
      it(@"constructs a mapping", ^{
        [[constructedMapping should] beMemberOfClass:[RKObjectMapping class]];
      });

      it(@"sets the correct class on the mapping", ^{
        [[constructedMapping.objectClass should] equal:[DreggableTask class]];
      });
      
      it(@"saves a reference to the mapping", ^{
        [[resource.mapping should] equal:constructedMapping];
      });

    });
    
    context(@"and has configured a serializationMapping", ^{
      __block RKObjectMapping *constructedMapping = nil;
      
      beforeEach(^{
        [resource mapSerialization:^(RKObjectMapping *mapping){
          constructedMapping = mapping;
        }];
      });
      
      it(@"constructs a serialization mapping", ^{
        [[constructedMapping should] beMemberOfClass:[RKObjectMapping class]];
      });
      
      it(@"sets the correct class on the mapping", ^{
        [[constructedMapping.objectClass should] equal:[DreggableTask class]];
      });
      
      it(@"saves a reference to the mapping", ^{
        [[resource.serializationMapping should] equal:constructedMapping];
      });
      
    });
    
    context(@"and has configured a root key", ^{
      it(@"sets the root key", ^{
        resource.rootKey = @"task";
        [[resource.rootKey should] equal:@"task"];
      });
    });
    
    context(@"and has routes configured", ^{
      __block DregsRoutingConfiguration *constructedRoutingConfig = nil;
      
      beforeEach(^{
        [resource route:^(DregsRoutingConfiguration *route){
          constructedRoutingConfig = route;
        }];
      });
      
      it(@"constructs a routing configuration", ^{
        [[constructedRoutingConfig should] beMemberOfClass:[DregsRoutingConfiguration class]];
      });
      
      it(@"saves the routing configuration", ^{
        [[constructedRoutingConfig should] equal:resource.routes];
      });
      
    });
    
  });
});

SPEC_END
