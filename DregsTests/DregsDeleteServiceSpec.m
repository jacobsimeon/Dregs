#import "DregsSpecHelper.h"

SPEC_BEGIN(DregsDeleteServiceSpec)

describe(@"DregsDeleteService", ^{
  
  RKObjectManager *manager = [DregsSpecHelper configuredManager];
  
  __block DregsDeleteService *service = nil;
  __block DreggableTask *task = nil;
  __block NSError *theError = nil;
  
  void (^deleteTask)(DreggableTask *) = ^(DreggableTask *target){
    
    [RKObjectManager setSharedManager:manager];
    
    [service delete:target success:^(id obj){
      task = [obj retain];
    } failure:^(NSError *error) {
      theError = [error retain];
    }];
    
  };
  
  beforeEach(^{
    service = [DregsDeleteService service];    
  });
    
  context(@"deletes an object on the server", ^{
    
    DreggableTask *target = [[DreggableTask alloc] init];
    target.id = [NSNumber numberWithInt:3000];
    
    it(@"tells the shared object manager to delete the object", ^{
      [[manager should] receive:@selector(deleteObject:delegate:) withArguments:target, service];
      deleteTask(target);
    });
    
    it(@"calls the success block", ^{
      deleteTask(target);
      [[expectFutureValue(task) shouldEventually] beNonNil];
    });
        
  });
  
  context(@"an error occurs while attempting to delete the object", ^{
    it(@"calls failure block on failure", ^{
      DreggableTask *target = [[DreggableTask alloc]init];
      target.id = [NSNumber numberWithInt:4000];
      deleteTask(target);
      [[expectFutureValue(theError) shouldEventually] beNonNil];
    });
    
    it(@"does not call success block", ^{
      task = nil;
      DreggableTask *target = [[DreggableTask alloc]init];
      target.id = [NSNumber numberWithInt:4000];
      deleteTask(target);
      [[expectFutureValue(theError) shouldEventually] beNonNil];
      [task shouldBeNil];
    });
    
  });
  
});

SPEC_END