//
//  DregsDeleteService.m
//  Bolst
//
//  Created by Jacob Morris on 6/15/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "DregsDeleteService.h"

@implementation DregsDeleteService

- (void) delete:(NSObject *)object
        success:(void (^)(id object))onSuccess
        failure:(void (^)(NSError *error))onError{
  [self retain];
  self.successBlock = onSuccess;
  self.failureBlock = onError;
  [[RKObjectManager sharedManager] deleteObject:object delegate:self];
}

@end
