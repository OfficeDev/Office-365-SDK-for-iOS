/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSItemCollectionOperations.h"

/**
* The implementation file for type MSItemCollectionOperations.
*/

@implementation MSItemCollectionOperations
-(NSURLSessionDataTask*)getByPath : (NSString *) path : (void (^)(MSItem *item, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

    NSArray* params = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :path,@"path",nil ],nil];

	NSString* parameters = [MSBaseODataContainerHelper getFunctionParameters: params];
	[url appendPathComponent:[[NSString alloc] initWithFormat:@"getByPath(%@)",parameters]];
	NSData* payload = nil;
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			MSItem * result = (MSItem *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSItem class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}		
@end