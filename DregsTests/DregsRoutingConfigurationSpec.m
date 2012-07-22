#import "DregsSpecHelper.h"

SPEC_BEGIN(DregsRoutingConfigurationSpec)

describe(@"DregsResourceConfiguration", ^{
  __block DregsRoutingConfiguration *route;
  
  beforeEach(^{
    route = [[DregsRoutingConfiguration alloc]init];
  });
  
  it(@"can configure the CREATE route", ^{
    route.create = @"tasks";
    [[route.create should] equal:@"tasks"];
  });
  
  it(@"can configure the READ route", ^{
    route.read = @"tasks";
    [[route.read should] equal:@"tasks"];    
  });

  it(@"can configure the UPDATE route", ^{
    route.update = @"tasks/:id";
    [[route.update should] equal:@"tasks/:id"];
  });

  it(@"can configure the DESTROY route", ^{
    route.destroy = @"tasks/:id";
    [[route.destroy should] equal:@"tasks/:id"];
  });

});

SPEC_END