/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "UserOperations.h"
#import <office365_odata_interfaces/Request.h>

@implementation UserOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    return [super initOperationWith:urlComponent :parent];
}

-(NSURLSessionDataTask*)sendMail : (Message *) Message : (bool ) SaveToSentItems : (void (^)(int returnValue, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"SendMail" :nil :POST :^(Response *r, NSError *error) {
        
        if(error != nil){
           // NSString* entityString = [[NSString alloc] initWithData:[r getContent] encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:[r getData] : nil : nil];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)calendarView : (NSDate *) StartDate : (NSDate *) EndDate : (void (^)(Event *event, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"CalendarView" :nil :POST :^(Response* r, NSError *error) {
        
        if(error != nil){
            //NSString* entityString = [[NSString alloc] initWithData:[r getContent] encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:[r getData] : [Event class] : @"value"];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end