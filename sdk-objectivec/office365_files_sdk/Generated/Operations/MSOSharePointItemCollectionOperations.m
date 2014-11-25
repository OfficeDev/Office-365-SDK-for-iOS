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

#import "MSOSharePointItemCollectionOperations.h"

/**
* The implementation file for type MSOSharePointItemCollectionOperations.
*/

@implementation MSOSharePointItemCollectionOperations

-(NSURLSessionDataTask*)getByPath : (NSString *) path : (void (^)(MSOSharePointItem *item, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];
		
	NSDictionary* params = [[NSDictionary alloc] initWithObjectsAndKeys:path,@"path",nil];

	NSString* parameters = [MSODataBaseContainerHelper getFunctionParameters: params];
	[url appendPathComponent:[[NSString alloc] initWithFormat:@"getByPath(%@)",parameters]];
    
	NSData* payload = nil;

	NSURLSessionDataTask* task = [super oDataExecuteForPath:url withContent:payload andMethod:POST andCallback:^(id<MSODataResponse> r, NSError *error) {
        
       if(error == nil){
			MSOSharePointItem * result = (MSOSharePointItem *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSOSharePointItem class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}		

@end