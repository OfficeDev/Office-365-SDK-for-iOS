/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "CalendarOperations.h"

@implementation CalendarOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    return [super initWith:urlComponent :parent];
}

-(NSURLSessionDataTask*)calendarView : (NSDate *) StartDate : (NSDate *) EndDate : (void (^)(Event *event, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"CalendarView" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error != nil){
            NSString* entityString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:entityString : [Event class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end