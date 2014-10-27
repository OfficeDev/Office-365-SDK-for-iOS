/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointFileOperations.h"
#import "MSSharePointBaseODataContainerHelper.h"

/**
* The implementation file for type MSSharePointFileOperations.
*/

@implementation MSSharePointFileOperations

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)copy : (NSString *) destFolderId : (NSString *) destFolderPath : (NSString *) newName : (void (^)(MSSharePointFile *file, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :destFolderId,@"destFolderId",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :destFolderPath,@"destFolderPath",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :newName,@"newName",nil ],nil];

	NSData* payload = [[MSSharePointBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"copy"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			MSSharePointFile * result = (MSSharePointFile *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSSharePointFile class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end