//
//  DregsError.m
//  Bolst
//
//  Created by Jacob Morris on 6/15/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "DregsError.h"

@interface DregsError (Private)
- (NSString *)multipleErrorsDescription;
@end

@implementation DregsError

@synthesize errors, error;

- (NSString *)multipleErrorsDescription{
  NSMutableArray *flattenedErrors = [NSMutableArray array];
  
  for (NSString *attributeName in self.errors.keyEnumerator) {    
  
    for(NSString *message in [self.errors objectForKey:attributeName]){
      NSString *capitalized = [attributeName capitalizedString];
      [flattenedErrors addObject:[capitalized stringByAppendingFormat:@" %@", message]];
    }
    
  }
  
  NSMutableString *finalError = [NSMutableString string];
  for(NSString *message in flattenedErrors){
    [finalError appendFormat:@"%@.\n", message];
  }
  return finalError;
}

- (NSString *) description{
  if(errors){
    return [self multipleErrorsDescription];
  } else {
    return error;
  }
}

@end
