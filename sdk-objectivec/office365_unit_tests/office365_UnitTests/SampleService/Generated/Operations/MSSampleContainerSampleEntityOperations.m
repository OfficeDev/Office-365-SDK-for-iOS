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

#import "MSSampleContainerSampleEntityOperations.h"

/**
* The implementation file for type MSSampleContainerSampleEntityOperations.
*/

@implementation MSSampleContainerSampleEntityOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent parent:parent];
}

-(NSURLSessionDataTask*)twoParamsActionsFirstIsEntityType : (MSSampleContainerSampleEntity *) anEntity : (bool) booleanParams : (void (^)(int returnValue, MSODataException *error))callback{
	
	NSString * anEntityString = [[[self getResolver] getJsonSerializer] serialize:anEntity : @"AnEntity"];
	NSString * booleanParamsString = [[[self getResolver] getJsonSerializer] serialize:(booleanParams ? @"true" : @"false") : @"BooleanParams"];

	NSURLSessionDataTask* task = [self twoParamsActionsFirstIsEntityTypeRaw 	: anEntityString: booleanParamsString :^(NSString *returnValue, MSODataException *error){
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : nil];
            callback(result, error);
        }
        else{
            callback((int)[returnValue integerValue], error);
        }
    }];
    
    return task;
}

-(NSURLSessionDataTask*)twoParamsActionsFirstIsEntityTypeRaw : (NSString*) anEntity : (NSString*) booleanParams : (void (^)(NSString*returnValue, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :anEntity,@"AnEntity",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :booleanParams,@"BooleanParams",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
[request setContent:payload];

	[[request getUrl] appendPathComponent:@"TwoParamsActionsFirstIsEntityType"];
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


-(NSURLSessionDataTask*)twoParamsActionsFirstIsComplexType : (MSSampleContainerSampleComplexType *) complexType : (bool) booleanParams : (void (^)(int returnValue, MSODataException *error))callback{
	
	NSString * complexTypeString = [[[self getResolver] getJsonSerializer] serialize:complexType : @"ComplexType"];
	NSString * booleanParamsString = [[[self getResolver] getJsonSerializer] serialize:(booleanParams ? @"true" : @"false") : @"BooleanParams"];

	NSURLSessionDataTask* task = [self twoParamsActionsFirstIsComplexTypeRaw 	: complexTypeString: booleanParamsString :^(NSString *returnValue, MSODataException *error){
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : nil];
            callback(result, error);
        }
        else{
            callback((int)[returnValue integerValue], error);
        }
    }];
    
    return task;
}

-(NSURLSessionDataTask*)twoParamsActionsFirstIsComplexTypeRaw : (NSString*) complexType : (NSString*) booleanParams : (void (^)(NSString*returnValue, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :complexType,@"ComplexType",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :booleanParams,@"BooleanParams",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
[request setContent:payload];

	[[request getUrl] appendPathComponent:@"TwoParamsActionsFirstIsComplexType"];
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


-(NSURLSessionDataTask*)twoParamsActionsFirstIsCollectionEntityType : (NSMutableArray<MSSampleContainerSampleEntity> *) collectionType : (bool) booleanParams : (void (^)(int returnValue, MSODataException *error))callback{
	
	NSString * collectionTypeString = [[[self getResolver] getJsonSerializer] serialize:collectionType : @"CollectionType"];
	NSString * booleanParamsString = [[[self getResolver] getJsonSerializer] serialize:(booleanParams ? @"true" : @"false") : @"BooleanParams"];

	NSURLSessionDataTask* task = [self twoParamsActionsFirstIsCollectionEntityTypeRaw 	: collectionTypeString: booleanParamsString :^(NSString *returnValue, MSODataException *error){
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : nil];
            callback(result, error);
        }
        else{
            callback((int)[returnValue integerValue], error);
        }
    }];
    
    return task;
}

-(NSURLSessionDataTask*)twoParamsActionsFirstIsCollectionEntityTypeRaw : (NSString*) collectionType : (NSString*) booleanParams : (void (^)(NSString*returnValue, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :collectionType,@"CollectionType",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :booleanParams,@"BooleanParams",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
[request setContent:payload];

	[[request getUrl] appendPathComponent:@"TwoParamsActionsFirstIsCollectionEntityType"];
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


-(NSURLSessionDataTask*)twoParamsActionsFirstIsCollectionComplexType : (NSMutableArray<MSSampleContainerSampleComplexType> *) collectionType : (bool) booleanParams : (void (^)(int returnValue, MSODataException *error))callback{
	
	NSString * collectionTypeString = [[[self getResolver] getJsonSerializer] serialize:collectionType : @"CollectionType"];
	NSString * booleanParamsString = [[[self getResolver] getJsonSerializer] serialize:(booleanParams ? @"true" : @"false") : @"BooleanParams"];

	NSURLSessionDataTask* task = [self twoParamsActionsFirstIsCollectionComplexTypeRaw 	: collectionTypeString: booleanParamsString :^(NSString *returnValue, MSODataException *error){
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : nil];
            callback(result, error);
        }
        else{
            callback((int)[returnValue integerValue], error);
        }
    }];
    
    return task;
}

-(NSURLSessionDataTask*)twoParamsActionsFirstIsCollectionComplexTypeRaw : (NSString*) collectionType : (NSString*) booleanParams : (void (^)(NSString*returnValue, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :collectionType,@"CollectionType",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :booleanParams,@"BooleanParams",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
[request setContent:payload];

	[[request getUrl] appendPathComponent:@"TwoParamsActionsFirstIsCollectionComplexType"];
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