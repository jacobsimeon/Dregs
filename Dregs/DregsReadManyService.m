//
//  DregsReadManyService.m
//  Bolst
//
//  Created by Jacob Morris on 6/15/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "DregsReadManyService.h"

@implementation DregsReadManyService

- (void) readObjectsAt:(NSString *)resourcePath
               success:(void (^)(id object))onSuccess
               failure:(void (^)(NSError *error))onError{
  [self retain];
  self.successBlock = onSuccess;
  self.failureBlock = onError;
  [[RKObjectManager sharedManager] loadObjectsAtResourcePath:resourcePath 
                                                    delegate:self];
}

- (void) objectLoader:(RKObjectLoader *)objectLoader didLoadObject:(id)object{
  NSLog(@"%@", object);
}

- (void) objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects{
  self.successBlock(objects);
  [self release];
}
   

@end
