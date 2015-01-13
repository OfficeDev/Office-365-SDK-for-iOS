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

#import "MSSharePointFileOperations.h"

/**
* The implementation file for type MSSharePointFileOperations.
*/

@implementation MSSharePointFileOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent parent:parent];
}

-(NSURLSessionDataTask*)copy : (NSString *) destFolderId : (NSString *) destFolderPath : (NSString *) newName : (void (^)(MSSharePointFile *file, MSODataException *error))callback{
	
	NSString * destFolderIdString = [[[self getResolver] getJsonSerializer] serialize:destFolderId : @"destFolderId"];
	NSString * destFolderPathString = [[[self getResolver] getJsonSerializer] serialize:destFolderPath : @"destFolderPath"];
	NSString * newNameString = [[[self getResolver] getJsonSerializer] serialize:newName : @"newName"];

	NSURLSessionDataTask* task = [self copyRaw 	: destFolderIdString: destFolderPathString: newNameString :^(NSString *returnValue, MSODataException *error){
       if(error == nil){
			MSSharePointFile * result = (MSSharePointFile *)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : [MSSharePointFile class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}

-(NSURLSessionDataTask*)copyRaw : (NSString*) destFolderId : (NSString*) destFolderPath : (NSString*) newName : (void (^)(NSString*file, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :destFolderId,@"destFolderId",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :destFolderPath,@"destFolderPath",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :newName,@"newName",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
[request setContent:payload];

	[[request getUrl] appendPathComponent:@"copy"];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}				
@end