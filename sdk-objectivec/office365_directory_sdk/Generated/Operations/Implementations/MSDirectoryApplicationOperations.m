/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryApplicationOperations.h"

/**
* The implementation file for type MSDirectoryApplicationOperations.
*/

@implementation MSDirectoryApplicationOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)restore : (NSMutableArray *) identifierUris : (void (^)(MSDirectoryApplication *application, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			NSArray* params = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :identifierUris,@"identifierUris",nil ],nil];

	NSString* parameters = [MSDirectoryBaseODataContainerHelper getFunctionParameters: params];
	[url appendPathComponent:[[NSString alloc] initWithFormat:@"restore(%@)",parameters]];
	NSData* payload = nil;
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :GET :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			MSDirectoryApplication * result = (MSDirectoryApplication *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSDirectoryApplication class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end