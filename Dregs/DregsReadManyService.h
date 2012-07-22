//
//  DregsReadManyService.h
//  Bolst
//
//  Created by Jacob Morris on 6/15/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "DregsServiceBase.h"

@interface DregsReadManyService : DregsServiceBase

- (void) readObjectsAt:(NSString *)resourcePath
               success:(void (^)(id object))onSuccess
               failure:(void (^)(NSError *error))onError;

@end
