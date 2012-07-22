//
//  DregsSpecHelper.h
//  Bolst
//
//  Created by Jacob Morris on 6/15/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "Kiwi.h"
#import "Dregs.h"
#import "DregsCreateService.h"
#import "DregsReadOneService.h"
#import "DregsReadManyService.h"
#import "DregsUpdateService.h"
#import "DregsDeleteService.h"
#import "DreggableTask.h"


@interface DregsSpecHelper : NSObject

+ (RKObjectManager *)configuredManager;

@end
