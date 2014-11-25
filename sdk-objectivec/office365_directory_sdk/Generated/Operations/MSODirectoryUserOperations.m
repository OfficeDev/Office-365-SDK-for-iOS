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

#import "MSODirectoryUserOperations.h"

/**
* The implementation file for type MSODirectoryUserOperations.
*/

@implementation MSODirectoryUserOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent{
    return [super initOperationWithUrl:urlComponent parent:parent];
}

-(NSURLSessionDataTask*)assignLicense : (NSMutableArray<MSODirectoryAssignedLicense> *) addLicenses : (NSMutableArray *) removeLicenses : (void (^)(MSODirectoryUser *user, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];
		
	NSDictionary* params = [[NSDictionary alloc] initWithObjectsAndKeys:addLicenses,@"addLicenses",removeLicenses,@"removeLicenses",nil];

	NSString* parameters = [MSODataBaseContainerHelper getFunctionParameters: params];
	[url appendPathComponent:[[NSString alloc] initWithFormat:@"assignLicense(%@)",parameters]];
	NSData* payload = nil;
		

	NSURLSessionDataTask* task = [super oDataExecuteForPath:url withContent : payload andMethod:GET andCallback:^(id<MSODataResponse> r, NSError *error) {
        
       if(error == nil){
			MSODirectoryUser * result = (MSODirectoryUser *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSODirectoryUser class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			
@end