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

#import "MSOutlookODataEntityFetcher.h"
#import "MSOutlookEntityOperations.h"
#import "MSOutlookEntity.h"

#import "MSOutlookUserFetcher.h"	
#import "MSOutlookFolderFetcher.h"	
#import "MSOutlookItemFetcher.h"	
#import "MSOutlookAttachmentFetcher.h"	
#import "MSOutlookCalendarFetcher.h"	
#import "MSOutlookCalendarGroupFetcher.h"	
#import "MSOutlookContactFolderFetcher.h"	
/**
* The header for type MSOutlookEntityFetcher.
*/

@protocol MSOutlookEntityFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookEntity* entity, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookEntity*, NSError * error))callback;
@end

@interface MSOutlookEntityFetcher : MSOutlookODataEntityFetcher<MSOutlookEntityFetcher>

-(MSOutlookEntityOperations*) getOperations;
		
-(MSOutlookUserFetcher*) asUser;	
		
-(MSOutlookFolderFetcher*) asFolder;	
		
-(MSOutlookItemFetcher*) asItem;	
		
-(MSOutlookAttachmentFetcher*) asAttachment;	
		
-(MSOutlookCalendarFetcher*) asCalendar;	
		
-(MSOutlookCalendarGroupFetcher*) asCalendarGroup;	
		
-(MSOutlookContactFolderFetcher*) asContactFolder;	
	
@end