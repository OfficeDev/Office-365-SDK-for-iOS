/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOUserOperations.h"

/**
* The implementation file for type MSOUserOperations.
*/

@implementation MSOUserOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)sendMail : (MSOMessage *) message : (bool) saveToSentItems : (void (^)(int returnValue, NSError *error))callback{

	id<MSOODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :message,@"Message",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :(saveToSentItems ? @"true" : @"false"),@"SaveToSentItems",nil ],nil];

	NSData* payload = [[MSOBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"SendMail"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSOResponse> r, NSError *error) {
        
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : nil];
            callback(result, error);
        }
        else{
            callback([r getStatus], error);
        }
    }];
    
    return task;
}			

@end