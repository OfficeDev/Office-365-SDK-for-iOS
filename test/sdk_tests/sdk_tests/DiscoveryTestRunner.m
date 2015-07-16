/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "DiscoveryTestRunner.h"

@implementation DiscoveryTestRunner

- (id)initWithClient:(MSDiscoveryClient *)client{
    
    if(self = [super init]) {
        
        self.client = client;
    }
    
    return self;
}

- (void)run:(NSString *)testName completionHandler:(void(^)(id test))result{
    
    if([testName isEqualToString: @"TestGetAllServices"]) return [self testGetAllServices:result];
    if([testName isEqualToString: @"TestGetServices"]) return [self testGetServices:result];
    if([testName isEqualToString: @"TestGetServiceById"]) return [self testGetServiceById:result];
    
    //Select, top, filter
    if([testName isEqualToString: @"TestFilterServices"]) return [self testFilterServices:result];
    if([testName isEqualToString: @"TestSelectServices"]) return [self testSelectServices:result];
    if([testName isEqualToString: @"TestTopServices"]) return [self testTopServices:result];
}

- (NSMutableArray *)getTests {
    
    NSMutableArray *array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetAllServices" displayName:@"Get all services" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetServices" displayName:@"Get services" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetServiceById" displayName:@"Get service by id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestFilterServices" displayName:@"Filter services" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestSelectServices" displayName:@"Select services" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestTopServices" displayName:@"Top services" ]];
    
    return array;
}

- (void)testGetAllServices:(void(^)(Test *))result {
    
    return [self.client.allServices readWithCallback:^(NSArray *serviceInfos, MSOrcError *error) {
     
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && serviceInfos != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(error!= nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

- (void)testGetServices:(void(^)(Test *))result {
    
    return [self.client.allServices readWithCallback:^(NSArray *serviceInfos, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && serviceInfos != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(error!= nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

- (void)testGetServiceById:(void(^)(Test *))result {
    
    return [self.client.allServices readWithCallback:^(NSArray *serviceInfos, MSOrcError *error) {
        
        MSDiscoveryServiceInfo *oneServiceInfo = serviceInfos[0];
        
        [[self.client.allServices getById:oneServiceInfo.entityKey] readWithCallback:^(MSDiscoveryServiceInfo *serviceInfo, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(error == nil && serviceInfo != nil && [serviceInfo.entityKey isEqualToString:oneServiceInfo.entityKey])
            {
                passed = true;
                message = @"Ok - ";
            }else{
                message = @"Not - ";
                if(error!= nil)
                    message = [message stringByAppendingString: [error localizedDescription]];
            }
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            result(test);
 
        }];
    }];
}

- (void)testFilterServices:(void(^)(Test *))result {
   
    //Get services
    return [self.client.allServices readWithCallback:^(NSArray *serviceInfos, MSOrcError *error) {
        
        MSDiscoveryServiceInfo *oneServiceInfo = serviceInfos[0];
        
        // Use filter to get service
        NSString *filter = [[@"entityKey eq '" stringByAppendingString:oneServiceInfo.entityKey] stringByAppendingString:@"'" ];
        
        [[self.client.allServices filter:filter] readWithCallback:^(NSArray *filteredServiceInfos, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(error == nil && filteredServiceInfos.count == 1
               && [[(MSDiscoveryServiceInfo*)[filteredServiceInfos objectAtIndex:0] entityKey] isEqualToString:oneServiceInfo.entityKey])
            {
                passed = true;
                message = @"Ok - ";
            }else{
                message = @"Not - ";
                if(error!= nil)
                    message = [message stringByAppendingString: [error localizedDescription]];
            }
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            result(test);
            
        }];
    }];
}

- (void)testSelectServices:(void(^)(Test *))result {
    
    //Get services
    return [self.client.allServices readWithCallback:^(NSArray *serviceInfos, MSOrcError *error) {
        
        MSDiscoveryServiceInfo *oneServiceInfo = serviceInfos[0];
        
        // Use filter to get service
        NSString *filter = [[@"ServiceName eq '" stringByAppendingString:oneServiceInfo.serviceName] stringByAppendingString:@"'" ];
       
        [[[self.client.allServices filter:filter] select:@"providerName"] readWithCallback:^(NSArray *filteredServiceInfos, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(error == nil && filteredServiceInfos.count > 0 && [(MSDiscoveryServiceInfo*)[filteredServiceInfos objectAtIndex:0] serviceName] == nil)
            {
                passed = true;
                message = @"Ok - ";
            }else{
                message = @"Not - ";
                if(error!= nil)
                    message = [message stringByAppendingString: [error localizedDescription]];
            }
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            result(test);
            
        }];
    }];
}

- (void)testTopServices:(void(^)(Test *))result {
    
    return [[self.client.allServices top:1] readWithCallback:^(NSArray *serviceInfos, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && serviceInfos != nil && serviceInfos.count == 1)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(error!= nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

@end