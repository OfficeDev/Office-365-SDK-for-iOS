/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "DiscoveryTestRunner.h"

@implementation DiscoveryTestRunner
-(id)initWithClient : (MSDiscoveryClient*)client{
    self.Client = client;
    return self;
}

-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (id test))result{
    
    if([testName isEqualToString: @"TestGetAllServices"]) return [self TestGetAllServices:result];
    if([testName isEqualToString: @"TestGetServices"]) return [self TestGetServices:result];
    if([testName isEqualToString: @"TestGetServiceById"]) return [self TestGetServiceById:result];
    
    //Select, top, filter
    if([testName isEqualToString: @"TestFilterServices"]) return [self TestFilterServices:result];
    if([testName isEqualToString: @"TestSelectServices"]) return [self TestSelectServices:result];
    if([testName isEqualToString: @"TestTopServices"]) return [self TestTopServices:result];
    return nil;
}

-(NSMutableArray*)getTests{
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self :@"TestGetAllServices" :@"Get all services" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetServices" :@"Get services" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetServiceById" :@"Get service by id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestFilterServices" :@"Filter services" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestSelectServices" :@"Select services" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestTopServices" :@"Top services" ]];
    
    return array;
}

-(NSURLSessionDataTask*)TestGetAllServices:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self.Client getallServices] read:^(NSArray<MSDiscoveryServiceInfo> *serviceInfos, MSODataException *error) {
     
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
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
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetServices:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self.Client getservices] read:^(NSArray<MSDiscoveryServiceInfo> *serviceInfos, MSODataException *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
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
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetServiceById:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self.Client getservices] read:^(NSArray<MSDiscoveryServiceInfo> *serviceInfos, MSODataException *error) {
        MSDiscoveryServiceInfo *oneServiceInfo = serviceInfos[0];
        [[[[self.Client getservices] getById:oneServiceInfo.entityKey] read:^(MSDiscoveryServiceInfo *serviceInfo, MSODataException *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
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
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
 
        }]resume];
        
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestFilterServices:(void (^) (Test*))result{
    //Get services
    NSURLSessionDataTask *task = [[self.Client getservices] read:^(NSArray<MSDiscoveryServiceInfo> *serviceInfos, MSODataException *error) {
        MSDiscoveryServiceInfo *oneServiceInfo = serviceInfos[0];
        // Use filter to get service
        NSString *filter = [[@"entityKey eq '" stringByAppendingString:oneServiceInfo.entityKey] stringByAppendingString:@"'" ];
        [[[[self.Client getservices]filter: filter]read:^(NSArray<MSDiscoveryServiceInfo> *filteredServiceInfos, MSODataException *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(error == nil && filteredServiceInfos.count == 1 && [[(MSDiscoveryServiceInfo*)[filteredServiceInfos objectAtIndex:0] entityKey] isEqualToString:oneServiceInfo.entityKey])
            {
                passed = true;
                message = @"Ok - ";
            }else{
                message = @"Not - ";
                if(error!= nil)
                    message = [message stringByAppendingString: [error localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
            
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestSelectServices:(void (^) (Test*))result{
    //Get services
    NSURLSessionDataTask *task = [[self.Client getservices] read:^(NSArray<MSDiscoveryServiceInfo> *serviceInfos, MSODataException *error) {
        MSDiscoveryServiceInfo *oneServiceInfo = serviceInfos[0];
        // Use filter to get service
        NSString *filter = [[@"ServiceName eq '" stringByAppendingString:oneServiceInfo.serviceName] stringByAppendingString:@"'" ];
        [[[[[self.Client getservices]filter: filter] select:@"providerName" ] read:^(NSArray<MSDiscoveryServiceInfo> *filteredServiceInfos, MSODataException *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
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
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
            
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestTopServices:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[[self.Client getallServices] top:1] read:^(NSArray<MSDiscoveryServiceInfo> *serviceInfos, MSODataException *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
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
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}


@end
