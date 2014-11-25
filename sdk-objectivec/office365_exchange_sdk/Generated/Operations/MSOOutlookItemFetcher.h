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
#import "MSOOutlookItemOperations.h"
#import "MSOOutlookItem.h"


#import "MSOOutlookMessageFetcher.h"
#import "MSOOutlookEventFetcher.h"
#import "MSOOutlookContactFetcher.h"
/**
* The header for type MSOOutlookItemFetcher.
*/

@protocol MSOOutlookItemFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOOutlookItem* item, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOOutlookItem*, NSError * error))callback;
@end

@interface MSOOutlookItemFetcher : MSODataEntityFetcher<MSOOutlookItemFetcher>

-(MSOOutlookItemOperations*) getOperations;

	
	
-(MSOOutlookMessageFetcher*) asMessage;	
	
	
-(MSOOutlookEventFetcher*) asEvent;	
	
	
-(MSOOutlookContactFetcher*) asContact;	
	
@end