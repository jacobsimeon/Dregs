//
//  Dregs.m
//  Bolst
//
//  Created by Jacob Morris on 6/14/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "Dregs.h"

@implementation Dregs

+ (void) configure:(RKObjectManager *)manager
        usingBlock:(void (^)(DregsConfigurator *config))configurationBlock{
  
  DregsConfigurator *config = [DregsConfigurator configurator];
  config.manager = manager;
  
  configurationBlock(config);
  
  RKObjectMapping *errorMapping = [RKObjectMapping mappingForClass:[DregsError class]];
  [errorMapping mapAttributes:@"errors", @"error", nil];
  manager.mappingProvider.errorMapping = errorMapping;
}



@end
