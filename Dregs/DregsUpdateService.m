//
//  DregsUpdateService.m
//  Bolst
//
//  Created by Jacob Morris on 6/15/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "DregsUpdateService.h"

@implementation DregsUpdateService

- (void) update:(NSObject *)object 
        success:(void (^)(id))onSuccess 
        failure:(void (^)(NSError *))onError{
  [self retain];
  self.successBlock = onSuccess;
  self.failureBlock = onError;
  [[RKObjectManager sharedManager] putObject:object delegate:self];
}

@end
