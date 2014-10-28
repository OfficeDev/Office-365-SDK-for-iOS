/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointItemCollectionOperations.h"
#import "MSSharePointBaseODataContainerHelper.h"

/**
* The implementation file for type MSSharePointItemCollectionOperations.
*/

@implementation MSSharePointItemCollectionOperations

-(NSURLSessionDataTask*)getByPath : (NSString *) path : (void (^)(MSSharePointItem *item, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

    NSDictionary* params = [[NSDictionary alloc] initWithObjectsAndKeys :path,@"path",nil ];

	NSString* parameters = [MSSharePointBaseODataContainerHelper getFunctionParameters: params];
	[url appendPathComponent:[[NSString alloc] initWithFormat:@"getByPath(%@)",parameters]];
	NSData* payload = nil;
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			MSSharePointItem * result = (MSSharePointItem *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSSharePointItem class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}		
@end