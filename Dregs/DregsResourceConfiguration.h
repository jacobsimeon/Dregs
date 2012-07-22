//
//  DregsObjectConfiguration.h
//  Bolst
//
//  Created by Jacob Morris on 6/14/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "DregsRoutingConfiguration.h"

@interface DregsResourceConfiguration : NSObject

@property (nonatomic, copy) Class resourceClass;
@property (nonatomic, retain) RKObjectMapping *mapping;
@property (nonatomic, retain) RKObjectMapping *serializationMapping;
@property (nonatomic, retain) NSString *rootKey;
@property (nonatomic, retain) DregsRoutingConfiguration *routes;

-(void)route:(void (^)(DregsRoutingConfiguration *))routingBlock;
-(void)map:(void (^)(RKObjectMapping *))mappingBlock;
-(void)mapSerialization:(void (^)(RKObjectMapping *))mappingBlock;
@end
