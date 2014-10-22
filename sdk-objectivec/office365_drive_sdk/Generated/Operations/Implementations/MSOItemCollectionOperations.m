/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOItemCollectionOperations.h"

/**
* The implementation file for type MSOItemCollectionOperations.
*/

@implementation MSOItemCollectionOperations

-(NSURLSessionDataTask*)getByPath : (NSString *) path : (void (^)(MSOItem *item, NSError *error))callback{

	id<MSOODataURL> url = [[self getResolver] createODataURL];

			NSArray* params = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :path,@"path",nil ],nil];

	NSString* parameters = [MSOBaseODataContainerHelper getFunctionParameters: params];
	[url appendPathComponent:[[NSString alloc] initWithFormat:@"getByPath(%@)",parameters]];
	NSData* payload = nil;
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSOResponse> r, NSError *error) {
        
       if(error == nil){
			MSOItem * result = (MSOItem *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : nil];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;

}		
@end