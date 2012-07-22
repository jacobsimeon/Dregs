//
//  DregsRoutingConfiguration.h
//  Bolst
//
//  Created by Jacob Morris on 6/14/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DregsRoutingConfiguration : NSObject

@property (nonatomic, retain) NSString *create;
@property (nonatomic, retain) NSString *read;
@property (nonatomic, retain) NSString *update;
@property (nonatomic, retain) NSString *destroy;

@end
