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
-(NSURLSessionDataTask*)add : (NSString *) name : (NSString *) nameConflict : (NSString *) type : (NSStream *) content : (void (^)(MSOItem *item, NSError *error))callback{

	id<MSOODataURL> url = [[self getResolver] createODataURL];

    NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :name,@"name",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :nameConflict,@"nameConflict",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :type,@"type",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :content,@"content",nil ],nil];

	NSData* payload = [[MSOBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"Add"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSOResponse> r, NSError *error) {
        
       if(error == nil){
			MSOItem * result = (MSOItem *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSOItem class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}		
-(NSURLSessionDataTask*)getByPath : (NSString *) path : (void (^)(MSOItem *item, NSError *error))callback{

	id<MSOODataURL> url = [[self getResolver] createODataURL];

    NSDictionary* params = [[NSDictionary alloc] initWithObjectsAndKeys :path,@"path",nil];

	NSString* parameters = [MSOBaseODataContainerHelper getFunctionParameters: params];
	[url appendPathComponent:[[NSString alloc] initWithFormat:@"GetByPath(%@)",parameters]];
	NSData* payload = nil;
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSOResponse> r, NSError *error) {
        
       if(error == nil){
			MSOItem * result = (MSOItem *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSOItem class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}		
@end