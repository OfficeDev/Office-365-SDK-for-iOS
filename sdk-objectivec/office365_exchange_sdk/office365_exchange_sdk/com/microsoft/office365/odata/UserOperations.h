/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@implementation UserOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;

-(NSURLSessionDataTask*)sendMail : (Message *) Message : (bool ) SaveToSentItems : :(void (^)(int d, NSError *error))callback;			

-(NSURLSessionDataTask*)calendarView : (NSDate *) StartDate : (NSDate *) EndDate : :(void (^)(Event d, NSError *error))callback;			
@end