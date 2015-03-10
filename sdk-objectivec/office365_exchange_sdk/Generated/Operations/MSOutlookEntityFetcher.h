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

@class MSOutlookUserFetcher;;
@class MSOutlookFolderFetcher;;
@class MSOutlookItemFetcher;;
@class MSOutlookAttachmentFetcher;;
@class MSOutlookCalendarFetcher;;
@class MSOutlookCalendarGroupFetcher;;
@class MSOutlookContactFolderFetcher;;
@class MSOutlookEntityOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookEntityFetcher.
*/


@protocol MSOutlookEntityFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSOutlookEntity* entity, MSODataException *error))callback;
-(NSURLSessionTask*) updateEntity:(id)entity withCallback:(void (^)(MSOutlookEntity*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteEntity:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookEntityFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookEntityFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSOutlookEntityFetcher>)select : (NSString*) params;
-(id<MSOutlookEntityFetcher>)expand : (NSString*) value;

@required
-(MSOutlookEntityOperations*) getOperations;
	
-(MSOutlookUserFetcher*) asUser;	
	
-(MSOutlookFolderFetcher*) asFolder;	
	
-(MSOutlookItemFetcher*) asItem;	
	
-(MSOutlookAttachmentFetcher*) asAttachment;	
	
-(MSOutlookCalendarFetcher*) asCalendar;	
	
-(MSOutlookCalendarGroupFetcher*) asCalendarGroup;	
	
-(MSOutlookContactFolderFetcher*) asContactFolder;	
@end

@interface MSOutlookEntityFetcher : MSODataEntityFetcher<MSOutlookEntityFetcher>

@end