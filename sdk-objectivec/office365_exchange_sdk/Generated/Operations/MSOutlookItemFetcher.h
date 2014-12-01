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
#import "MSOutlookItemOperations.h"
#import "MSOutlookItem.h"


#import "MSOutlookMessageFetcher.h"
#import "MSOutlookEventFetcher.h"
#import "MSOutlookContactFetcher.h"
/**
* The header for type MSOutlookItemFetcher.
*/

@protocol MSOutlookItemFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookItem* item, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateItem:(id)entity withCallback:(void (^)(MSOutlookItem*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteItem:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookItemFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookItemFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSOutlookItemFetcher : MSODataEntityFetcher<MSOutlookItemFetcher>

-(MSOutlookItemOperations*) getOperations;

	
	
-(MSOutlookMessageFetcher*) asMessage;	
	
	
-(MSOutlookEventFetcher*) asEvent;	
	
	
-(MSOutlookContactFetcher*) asContact;	
	
@end