/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataEntityFetcher.h"
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

@interface MSOutlookItemFetcher : MSOutlookODataEntityFetcher<MSOutlookItemFetcher>

-(MSOutlookItemOperations*) getOperations;
		
-(MSOutlookMessageFetcher*) asMessage;	
		
-(MSOutlookEventFetcher*) asEvent;	
		
-(MSOutlookContactFetcher*) asContact;	
	
@end