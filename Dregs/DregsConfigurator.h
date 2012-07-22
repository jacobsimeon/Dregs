//
//  DregsConfigurator.h
//  Bolst
//
//  Created by Jacob Morris on 6/14/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DregsResourceConfiguration.h"

@interface DregsConfigurator : NSObject

+ (DregsConfigurator *) configurator;

@property (nonatomic, retain) RKObjectManager *manager;

- (void) resource:(void (^)(DregsResourceConfiguration *))resourceConfigBlock;

@end
