/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookEntityFetcher.h"


/**
* The implementation file for type MSOutlookEntityFetcher.
*/


@implementation MSOutlookEntityFetcher
-(MSOutlookEntityOperations*) getOperations{
	return [[MSOutlookEntityOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOutlookEntity class]];
}

	
-(MSOutlookUserFetcher*) asUser{
	return [[MSOutlookUserFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSOutlookUser class]];
}	
		
-(MSOutlookFolderFetcher*) asFolder{
	return [[MSOutlookFolderFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSOutlookFolder class]];
}	
		
-(MSOutlookItemFetcher*) asItem{
	return [[MSOutlookItemFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSOutlookItem class]];
}	
		
-(MSOutlookAttachmentFetcher*) asAttachment{
	return [[MSOutlookAttachmentFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSOutlookAttachment class]];
}	
		
-(MSOutlookCalendarFetcher*) asCalendar{
	return [[MSOutlookCalendarFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSOutlookCalendar class]];
}	
		
-(MSOutlookCalendarGroupFetcher*) asCalendarGroup{
	return [[MSOutlookCalendarGroupFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSOutlookCalendarGroup class]];
}	
		
-(MSOutlookContactFolderFetcher*) asContactFolder{
	return [[MSOutlookContactFolderFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSOutlookContactFolder class]];
}	
	
@end