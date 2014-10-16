/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOUserOperations.h"
#import  <office365_exchange_helpers/BaseODataContainerHelper.h>
/**
* The implementation file for type MSOUserOperations.
*/

@implementation MSOUserOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)sendMail : (MSOMessage *) message : (bool) saveToSentItems : (void (^)(int returnValue, NSError *error))callback{
    
    NSArray* parameters = [[NSArray alloc] initWithObjects:
                           [[NSDictionary alloc] initWithObjectsAndKeys :message,@"Message",nil ],
                           [[NSDictionary alloc] initWithObjectsAndKeys :(saveToSentItems ? @"true" : @"false"),@"SaveToSentItems",nil ],nil];
    
    NSData* payload = [[MSOBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask* task = [self oDataExecute:@"SendMail" :payload :POST :^(id<MSOResponse> r, NSError *error) {
        
        if(error == nil){
            int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : nil];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}

-(NSURLSessionDataTask*)calendarView : (NSDate *) startDate : (NSDate *) endDate : (void (^)(MSOEvent *event, NSError *error))callback{

    NSURLSessionDataTask* task = [self oDataExecute:@"CalendarView" :nil :POST :^(id<MSOResponse> result, NSError *error) {
        
       if(error == nil){
            callback([result getData], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end