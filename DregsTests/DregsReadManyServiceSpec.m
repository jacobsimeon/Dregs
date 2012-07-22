#import "DregsSpecHelper.h"

SPEC_BEGIN(DregsReadManyServiceSpec)

describe(@"DregsReadManyService", ^{
  
  RKObjectManager *manager = [DregsSpecHelper configuredManager];
  
  __block DregsReadManyService *service = nil;
  __block NSArray *tasks = nil;
  __block NSError *theError = nil;
  
  void (^readTasks)(void) = ^{
    
    [RKObjectManager setSharedManager:manager];
    
    [service readObjectsAt:@"/tasks" success:^(NSArray *objects){
      tasks = [objects retain];
    } failure:^(NSError *error) {
      theError = [error retain];
    }];
    
  };
  
  beforeEach(^{
    service = [DregsReadManyService service];    
  });
  
  context(@"successfully reads objects from the server", ^{
    
    beforeAll(^{
      readTasks();            
    });

    it(@"runs the success callback", ^{
      [[expectFutureValue(tasks) shouldEventually] beNonNil];
    });
    
    it(@"passes all the objects that were read from the server", ^{
      [[expectFutureValue(tasks) shouldEventually] beNonNil];
      [[theValue(tasks.count) should] equal:theValue(5)];
    });
    
  });
  
});

SPEC_END
