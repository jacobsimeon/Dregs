//
//  DregsServiceBase.h
//  Bolst
//
//  Created by Jacob Morris on 6/15/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <RestKit/RestKit.h>

@interface DregsServiceBase : NSObject<RKObjectLoaderDelegate>

+ (id) service;

@property (nonatomic, copy) void(^successBlock)(id);
@property (nonatomic, copy) void(^failureBlock)(NSError *);

@end
