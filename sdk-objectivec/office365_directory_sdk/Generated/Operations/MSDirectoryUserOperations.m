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

#import "MSDirectoryUserOperations.h"

/**
* The implementation file for type MSDirectoryUserOperations.
*/

@implementation MSDirectoryUserOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent parent:parent];
}

-(NSURLSessionDataTask*)assignLicense : (NSMutableArray<MSDirectoryAssignedLicense> *) addLicenses : (NSMutableArray *) removeLicenses : (void (^)(MSDirectoryUser *user, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
		
	NSDictionary* params = [[NSDictionary alloc] initWithObjectsAndKeys:addLicenses,@"addLicenses",removeLicenses,@"removeLicenses",nil];

	NSString* parameters = [MSODataBaseContainerHelper getFunctionParameters: params];
	[[request getUrl] appendPathComponent:[[NSString alloc] initWithFormat:@"assignLicense(%@)",parameters]];
	NSData* payload = nil;
		
	[request setContent:payload];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
       if(error == nil){
			MSDirectoryUser * result = (MSDirectoryUser *)[[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : [MSDirectoryUser class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			
@end