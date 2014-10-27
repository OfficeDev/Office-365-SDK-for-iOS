/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookUserOperations.h"
#import "MSOutlookBaseODataContainerHelper.h"

/**
* The implementation file for type MSOutlookUserOperations.
*/

@implementation MSOutlookUserOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)sendMail : (MSOutlookMessage *) message : (bool) saveToSentItems : (void (^)(int returnValue, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :message,@"Message",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :(saveToSentItems ? @"true" : @"false"),@"SaveToSentItems",nil ],nil];

	NSData* payload = [[MSOutlookBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"SendMail"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
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
