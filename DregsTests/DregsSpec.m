#import "DregsSpecHelper.h"

SPEC_BEGIN(DregsSpec)

describe(@"Dregs", ^{
  context(@"configured with a base url", ^{
    
    NSString *baseUrl = @"http://localhost:4567";
    __block DregsConfigurator *constructedConfiguration = nil;
    
    RKObjectManager *manager = [RKObjectManager objectManagerWithBaseURLString:baseUrl];
    RKObjectMappingProvider *mapper = manager.mappingProvider;
    
    [Dregs configure:manager usingBlock:^(DregsConfigurator *configure) {
      constructedConfiguration = configure;
    }];
      
    it(@"constructs a configuration object", ^{
      [[constructedConfiguration should] beMemberOfClass:[DregsConfigurator class]];
    });
       
    it(@"sets the configuration's manager", ^{
      [[constructedConfiguration.manager should] equal:manager];
    });
    
    it(@"sets the correct root url", ^{
      [[[constructedConfiguration.manager.baseURL absoluteString] should] equal:baseUrl];   
    });
    
    it(@"registers the default mapping for DregsError", ^{
      [[[mapper.errorMapping objectClass] should] equal:[DregsError class]];
    });
    
  });  
});

SPEC_END
