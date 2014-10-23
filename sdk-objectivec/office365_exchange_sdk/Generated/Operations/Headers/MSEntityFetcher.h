/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSEntityOperations.h"
#import "MSEntity.h"

#import "MSUserFetcher.h"	
#import "MSFolderFetcher.h"	
#import "MSItemFetcher.h"	
#import "MSAttachmentFetcher.h"	
#import "MSCalendarFetcher.h"	
#import "MSCalendarGroupFetcher.h"	
#import "MSContactFolderFetcher.h"	
/**
* The header for type MSEntityFetcher.
*/

@protocol MSEntityFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSEntity* entity, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSEntity*, NSError * error))callback;
@end

@interface MSEntityFetcher : MSODataEntityFetcher<MSEntityFetcher>

-(MSEntityOperations*) getOperations;
		
-(MSUserFetcher*) asUser;	
		
-(MSFolderFetcher*) asFolder;	
		
-(MSItemFetcher*) asItem;	
		
-(MSAttachmentFetcher*) asAttachment;	
		
-(MSCalendarFetcher*) asCalendar;	
		
-(MSCalendarGroupFetcher*) asCalendarGroup;	
		
-(MSContactFolderFetcher*) asContactFolder;	
	
@end