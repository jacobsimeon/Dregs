#import "DregsSpecHelper.h"

SPEC_BEGIN(DregsReadOneServiceSpec)

describe(@"DregsReadOneService", ^{
  
  RKObjectManager *manager = [DregsSpecHelper configuredManager];
  
  __block DregsReadOneService *service = nil;
  __block DreggableTask *target = nil;
  __block DreggableTask *taskThatWasRead = nil;
  __block NSError *theError = nil;
  
  void (^readTask)(DreggableTask *) = ^(DreggableTask *task) {

    [RKObjectManager setSharedManager:manager];
    
    [service readObject:task success:^(id obj){
      taskThatWasRead = [obj retain];
    } failure:^(NSError *error) {
      theError = [error retain];
    }];
    
  };
  
  beforeEach(^{
    service = [DregsReadOneService service];    
    target = [[DreggableTask alloc]init];
  });
    
  context(@"successfully reads an object from the server", ^{
    
    beforeAll(^{
      target.id = [NSNumber numberWithInt:1000];
      readTask(target);            
    });
    
    it(@"runs the success callback", ^{
      [[expectFutureValue(taskThatWasRead) shouldEventually] beNonNil];
    });
    
    it(@"passes the read object with updated values", ^{
      [[expectFutureValue(taskThatWasRead.description) shouldEventually]
       equal:@"a task that was read from the server"];
    });

  });
        
});

SPEC_END
