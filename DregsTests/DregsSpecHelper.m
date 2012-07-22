//
//  DregsSpecHelper.m
//  Bolst
//
//  Created by Jacob Morris on 6/15/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "DregsSpecHelper.h"

@implementation DregsSpecHelper

+ (RKObjectManager *)configuredManager{
  
  NSString *baseUrl = @"http://localhost:4567";
  RKObjectManager *manager = [RKObjectManager managerWithBaseURLString:baseUrl];
  
  [Dregs configure:manager usingBlock:^(DregsConfigurator *configure) {
    [configure resource:^(DregsResourceConfiguration *resource) {
      
      resource.resourceClass = [DreggableTask class];
      resource.rootKey = @"task";
      [resource route:^(DregsRoutingConfiguration *route){
        route.create = @"tasks";
        route.read = @"tasks/:id";
        route.update = @"/tasks/:id";
        route.destroy = @"/tasks/:id";
      }];
      [resource map:^(RKObjectMapping *mapping) {
        [mapping mapAttributes:@"id", @"description", nil];
      }];
      
      [resource mapSerialization:^(RKObjectMapping *mapping) {
        [mapping mapAttributes:@"id", @"description", nil];
      }];
      
    }];
  }];
  
  return manager;
}

@end
