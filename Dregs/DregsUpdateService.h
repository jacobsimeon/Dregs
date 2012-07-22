//
//  DregsUpdateService.h
//  Bolst
//
//  Created by Jacob Morris on 6/15/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "DregsServiceBase.h"

@interface DregsUpdateService : DregsServiceBase

- (void) update:(NSObject *)object
        success:(void (^)(id object))onSuccess
        failure:(void (^)(NSError *error))onError;

@end
