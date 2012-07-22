//
//  Dregs.h
//  Bolst
//
//  Created by Jacob Morris on 6/14/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DregsConfigurator.h"
#import "DregsError.h"
#import "DregsCreateService.h"
#import "DregsReadOneService.h"
#import "DregsReadManyService.h"
#import "DregsUpdateService.h"
#import "DregsDeleteService.h"

@interface Dregs : NSObject

+ (void) configure:(RKObjectManager *)manager
        usingBlock:(void (^)(DregsConfigurator *config))configurationBlock;

@end

