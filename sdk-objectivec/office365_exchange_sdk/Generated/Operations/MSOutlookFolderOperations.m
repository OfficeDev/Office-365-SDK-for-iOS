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

#import "MSOutlookODataEntities.h"

/**
* The implementation file for type MSOutlookFolderOperations.
*/

@implementation MSOutlookFolderOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent parent:parent];
}


-(NSURLSessionTask*) copy : (NSString *) destinationId :  (void (^)(MSOutlookFolder *folder, MSODataException *error)) callback;{
	
	NSString * destinationIdString = [[[self getResolver] getJsonSerializer] serialize:destinationId : @"DestinationId"];

	NSURLSessionTask* task = [self copyRaw 	: destinationIdString :^(NSString *returnValue, MSODataException *error){
       
	   if(error == nil){
			MSOutlookFolder * result = (MSOutlookFolder *)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : [MSOutlookFolder class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}

-(NSURLSessionTask*) copyRaw : (NSString*) destinationId :  (void(^)(NSString* returnValue, MSODataException *error)) callback;{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	NSArray* parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId", nil], nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload : parameters
                                                                  :[self getResolver]]dataUsingEncoding
                                                                  :NSUTF8StringEncoding];
	[request setContent:payload];

	
	[[request getUrl] appendPathComponent:@"Copy"];
	[request setVerb:POST];

	NSURLSessionTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        
		if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}
    				

-(NSURLSessionTask*) move : (NSString *) destinationId :  (void (^)(MSOutlookFolder *folder, MSODataException *error)) callback;{
	
	NSString * destinationIdString = [[[self getResolver] getJsonSerializer] serialize:destinationId : @"DestinationId"];

	NSURLSessionTask* task = [self moveRaw 	: destinationIdString :^(NSString *returnValue, MSODataException *error){
       
	   if(error == nil){
			MSOutlookFolder * result = (MSOutlookFolder *)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : [MSOutlookFolder class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}

-(NSURLSessionTask*) moveRaw : (NSString*) destinationId :  (void(^)(NSString* returnValue, MSODataException *error)) callback;{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	NSArray* parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId", nil], nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload : parameters
                                                                  :[self getResolver]]dataUsingEncoding
                                                                  :NSUTF8StringEncoding];
	[request setContent:payload];

	
	[[request getUrl] appendPathComponent:@"Move"];
	[request setVerb:POST];

	NSURLSessionTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        
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