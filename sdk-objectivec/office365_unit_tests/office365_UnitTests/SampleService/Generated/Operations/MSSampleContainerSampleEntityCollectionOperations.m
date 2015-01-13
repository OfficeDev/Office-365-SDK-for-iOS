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

#import "MSSampleContainerSampleEntityCollectionOperations.h"

/**
* The implementation file for type MSSampleContainerSampleEntityCollectionOperations.
*/

@implementation MSSampleContainerSampleEntityCollectionOperations


-(NSURLSessionDataTask*)someFunction : (NSString *) path : (void (^)(MSSampleContainerSampleComplexType *samplecomplextype, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	NSDictionary* params = [[NSDictionary alloc] initWithObjectsAndKeys:path,@"path",nil];

	NSString* parameters = [MSODataBaseContainerHelper getFunctionParameters: params];
	[[request getUrl] appendPathComponent:[[NSString alloc] initWithFormat:@"SomeFunction(%@)",parameters]];
		
	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback: ^(id<MSODataResponse> r, MSODataException *error){

       if(error == nil){
			MSSampleContainerSampleComplexType * result = (MSSampleContainerSampleComplexType *)[[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : [MSSampleContainerSampleComplexType class]];
           
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}		

@end