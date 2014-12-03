/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSOutlookUserOperations.h"

/**
* The implementation file for type MSOutlookUserOperations.
*/

@implementation MSOutlookUserOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent parent:parent];
}

-(NSURLSessionDataTask*)sendMail : (MSOutlookMessage *) message : (bool) saveToSentItems : (void (^)(int returnValue, MSODataException *error))callback{
	
	NSString * messageString = [[[self getResolver] getJsonSerializer] serialize:message];
	NSString * saveToSentItemsString = [[[self getResolver] getJsonSerializer] serialize:(saveToSentItems ? @"true" : @"false") : @"SaveToSentItems"];

	NSURLSessionDataTask* task = [self sendMailRaw 	: messageString: saveToSentItemsString :^(NSString *returnValue, MSODataException *error){
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : nil];
            callback(result, error);
        }
        else{
            callback((int)[returnValue integerValue], error);
        }
    }];
    
    return task;
}

-(NSURLSessionDataTask*)sendMailRaw : (NSString*) message : (NSString*) saveToSentItems : (void (^)(NSString*returnValue, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :message,@"Message",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :saveToSentItems,@"SaveToSentItems",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
[request setContent:payload];

	[[request getUrl] appendPathComponent:@"SendMail"];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}				
@end