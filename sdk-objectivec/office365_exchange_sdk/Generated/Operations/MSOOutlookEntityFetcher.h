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
#import "MSOOutlookEntityOperations.h"
#import "MSOOutlookEntity.h"


#import "MSOOutlookUserFetcher.h"
#import "MSOOutlookFolderFetcher.h"
#import "MSOOutlookItemFetcher.h"
#import "MSOOutlookAttachmentFetcher.h"
#import "MSOOutlookCalendarFetcher.h"
#import "MSOOutlookCalendarGroupFetcher.h"
#import "MSOOutlookContactFolderFetcher.h"
/**
* The header for type MSOOutlookEntityFetcher.
*/

@protocol MSOOutlookEntityFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOOutlookEntity* entity, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOOutlookEntity*, NSError * error))callback;
@end

@interface MSOOutlookEntityFetcher : MSODataEntityFetcher<MSOOutlookEntityFetcher>

-(MSOOutlookEntityOperations*) getOperations;

	
	
-(MSOOutlookUserFetcher*) asUser;	
	
	
-(MSOOutlookFolderFetcher*) asFolder;	
	
	
-(MSOOutlookItemFetcher*) asItem;	
	
	
-(MSOOutlookAttachmentFetcher*) asAttachment;	
	
	
-(MSOOutlookCalendarFetcher*) asCalendar;	
	
	
-(MSOOutlookCalendarGroupFetcher*) asCalendarGroup;	
	
	
-(MSOOutlookContactFolderFetcher*) asContactFolder;	
	
@end