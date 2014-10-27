/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

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
-(NSURLSessionDataTask *)execute:(void (^)(MSOutlookEntity* entity, NSError *error))callback;
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