//
//  DregsCreateService.m
//  Bolst
//
//  Created by Jacob Morris on 6/15/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "DregsCreateService.h"

@implementation DregsCreateService

- (void) createObject:(NSObject *)object 
              success:(void (^)(id object))onSuccess
              failure:(void (^)(NSError *error))onError{
  [self retain];
  self.successBlock = onSuccess;
  self.failureBlock = onError;
  [[RKObjectManager sharedManager] postObject:object delegate:self];
}

@end
