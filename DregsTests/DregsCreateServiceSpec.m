#import "DregsSpecHelper.h"

SPEC_BEGIN(DregsCreateServiceSpec)

describe(@"DregsCreateService", ^{
  context(@"Dregs is configured to create tasks", ^{
    
    RKObjectManager *manager = [DregsSpecHelper configuredManager];    
    
    __block DregsCreateService *service = nil;
    
    __block NSString *itSucceeded = nil;
    __block NSString *itFailed = nil;
    
    __block DreggableTask *target = nil;
    __block DreggableTask *createdTask = nil;
    __block NSError *theError = nil;
    
    void (^createTask)(DreggableTask *) = ^(DreggableTask *task) {
      
      [RKObjectManager setSharedManager:manager];
      [service createObject:task success:^(id obj){
        itSucceeded = @"itSucceeded";
        createdTask = [obj retain];
      } failure:^(NSError *error) {
        itFailed = @"itFailed";
        theError = [error retain];
      }];
      
    };
    
    beforeEach(^{
      target = [[DreggableTask alloc] init];
      service = [DregsCreateService service];
    });
        
    it(@"invokes postObject on the shared object manager", ^{
      [[manager should] receive:@selector(postObject:delegate:) withArguments:target, service];
      target.description = @"any old task";
      createTask(target);
    });
    
    context(@"creating the object is successful", ^{
      
      beforeAll(^{
        target.description = @"a perfectly ok task";
        createTask(target);
      });
      
      it(@"runs the success block", ^{
        [[expectFutureValue(itSucceeded) shouldEventually] equal:@"itSucceeded"];
      });        
      
      it(@"passes the created object to the success block", ^{
        [[expectFutureValue(createdTask) shouldEventually] beNonNil];
      });
      
      it(@"updates the object with an id", ^{
        [[expectFutureValue(createdTask.id) shouldEventually] equal:[NSNumber numberWithInt:1]];
      });
      
    });
    
    context(@"a client error occurs", ^{
      
      beforeAll(^{
        target.description = @"a task to cause a client error";
        createTask(target);
      });
      
      it(@"runs the failure block", ^{
        [[expectFutureValue(itFailed) shouldEventually] equal:@"itFailed"];
      });
      
      it(@"passes a correctly configured error object", ^{
        [[theError.localizedDescription should] equal:@"you caused a client error"];
      });
      
    });
    
    context(@"a server error occurs", ^{
      
      beforeAll(^{
        target.description = @"a task to cause a server error";
        createTask(target);
      });
      
      it(@"runs the failure block", ^{
        [[expectFutureValue(itFailed) shouldEventually] equal:@"itFailed"];
      });
      
      it(@"builds the error", ^{
        [[theError.localizedDescription should] 
         equal:@"The operation couldn’t be completed. (org.restkit.RestKit.ErrorDomain error 4.)"];
      });
      
    });
    
    context(@"an unknown response is received", ^{
      
      beforeAll(^{
        target.description = @"a task to cause an unexpected response";
        createTask(target);
      });
      
      it(@"runs the failure block", ^{
        [[expectFutureValue(itFailed) shouldEventually] equal:@"itFailed"];
      });
      
      it(@"builds the error", ^{
        [[theError.localizedDescription should] 
         equal:@"The operation couldn’t be completed. (org.restkit.RestKit.ErrorDomain error 4.)"];
      });
      
    });
    
  });
});  

SPEC_END
