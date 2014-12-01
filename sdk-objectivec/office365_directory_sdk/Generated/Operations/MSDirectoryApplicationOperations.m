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

#import "MSDirectoryApplicationOperations.h"

/**
* The implementation file for type MSDirectoryApplicationOperations.
*/

@implementation MSDirectoryApplicationOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent parent:parent];
}

-(NSURLSessionDataTask*)restore : (NSMutableArray *) identifierUris : (void (^)(MSDirectoryApplication *application, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
		
	NSDictionary* params = [[NSDictionary alloc] initWithObjectsAndKeys:identifierUris,@"identifierUris",nil];

	NSString* parameters = [MSODataBaseContainerHelper getFunctionParameters: params];
	[[request getUrl] appendPathComponent:[[NSString alloc] initWithFormat:@"restore(%@)",parameters]];
	NSData* payload = nil;
		
	[request setContent:payload];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
       if(error == nil){
			MSDirectoryApplication * result = (MSDirectoryApplication *)[[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : [MSDirectoryApplication class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			
@end