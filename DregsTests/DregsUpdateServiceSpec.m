#import "DregsSpecHelper.h"

SPEC_BEGIN(DregsUpdateServiceSpec)

describe(@"DregsUpdateService", ^{
  
  RKObjectManager *manager = [DregsSpecHelper configuredManager];
  
  __block DregsUpdateService *service = nil;
  __block DreggableTask *task = nil;
  __block NSError *theError = nil;
  
  void (^updateTask)(DreggableTask *) = ^(DreggableTask *target){
    
    [RKObjectManager setSharedManager:manager];
    
    [service update:target success:^(id obj){
      task = [obj retain];
    } failure:^(NSError *error) {
      theError = [error retain];
    }];
    
  };
  
  beforeEach(^{
    service = [DregsUpdateService service];    
  });
   
  context(@"update an object on the server", ^{
    
    it(@"tells the shared object manager to update the object", ^{
      DreggableTask *target = [[DreggableTask alloc] init];
      target.id = [NSNumber numberWithInt:2000];
      [[manager should] receive:@selector(putObject:delegate:) withArguments:target, service];
      updateTask(target);
    });
    
    it(@"calls the success block", ^{
      [[expectFutureValue(task) shouldEventually] beNonNil];
    });
    
  });
  
});

SPEC_END
