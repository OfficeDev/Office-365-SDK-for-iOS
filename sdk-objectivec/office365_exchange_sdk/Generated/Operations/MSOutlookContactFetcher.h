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

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookContactOperations.h"
#import "MSOutlookContact.h"


/**
* The header for type MSOutlookContactFetcher.
*/

@protocol MSOutlookContactFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookContact* contact, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateContact:(id)entity withCallback:(void (^)(MSOutlookContact*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteContact:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookContactFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookContactFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSOutlookContactFetcher : MSODataEntityFetcher<MSOutlookContactFetcher>

-(MSOutlookContactOperations*) getOperations;

	
@end