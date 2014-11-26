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
-(NSURLSessionDataTask *)execute:(void (^)(MSOutlookItem* item, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookItem*, NSError * error))callback;
@end

@interface MSOutlookItemFetcher : MSODataEntityFetcher<MSOutlookItemFetcher>

-(MSOutlookItemOperations*) getOperations;

	
	
-(MSOutlookMessageFetcher*) asMessage;	
	
	
-(MSOutlookEventFetcher*) asEvent;	
	
	
-(MSOutlookContactFetcher*) asContact;	
	
@end