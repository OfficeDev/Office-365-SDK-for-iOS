/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookFolderOperations.h"
#import "MSOutlookBaseODataContainerHelper.h"

/**
* The implementation file for type MSOutlookFolderOperations.
*/

@implementation MSOutlookFolderOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)copy : (NSString *) destinationId : (void (^)(MSOutlookFolder *folder, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId",nil ],nil];

	NSData* payload = [[MSOutlookBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"Copy"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			MSOutlookFolder * result = (MSOutlookFolder *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSOutlookFolder class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSOutlookFolder *folder, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId",nil ],nil];

	NSData* payload = [[MSOutlookBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"Move"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			MSOutlookFolder * result = (MSOutlookFolder *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSOutlookFolder class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end
