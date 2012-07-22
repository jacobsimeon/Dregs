//
//  DregsServiceBase.m
//  Bolst
//
//  Created by Jacob Morris on 6/15/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "DregsServiceBase.h"

@implementation DregsServiceBase

@synthesize successBlock, failureBlock;

+ (id)service{
  return [[[self alloc]init]autorelease];
}

- (void) objectLoader:(RKObjectLoader *)objectLoader didLoadObject:(id)object{
  if(self.successBlock){
    self.successBlock(object);
    [self release];
  }
}

- (void) objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error{
  if(self.failureBlock){
    self.failureBlock(error);
    [self release];
  }
}

- (void) dealloc{
  self.successBlock = nil;
  self.failureBlock = nil;
  [super dealloc];  
}

@end
