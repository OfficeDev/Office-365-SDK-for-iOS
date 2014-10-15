/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendarOperations.h"

/**
* The implementation file for type MSOCalendarOperations.
*/

@implementation MSOCalendarOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
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