//
//  DregsReadOneService.m
//  Bolst
//
//  Created by Jacob Morris on 6/15/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "DregsReadOneService.h"

@implementation DregsReadOneService

@synthesize successBlock, failureBlock;

- (void) readObject:(NSObject *)object 
            success:(void (^)(id object))onSuccess
            failure:(void (^)(NSError *error))onError{
  self.successBlock = onSuccess;
  self.failureBlock = onError;
  [self retain];
  [[RKObjectManager sharedManager] getObject:object delegate:self];
}

@end
