/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOEntityFetcher.h"


/**
* The implementation file for type MSOEntityFetcher.
*/


@implementation MSOEntityFetcher
-(MSOEntityOperations*) getOperations{
	return [[MSOEntityOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOEntity class]];
}

	
-(MSOUserFetcher*) asUser{
	return [[MSOUserFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSOFolderFetcher*) asFolder{
	return [[MSOFolderFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSOItemFetcher*) asItem{
	return [[MSOItemFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSOAttachmentFetcher*) asAttachment{
	return [[MSOAttachmentFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSOCalendarFetcher*) asCalendar{
	return [[MSOCalendarFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSOCalendarGroupFetcher*) asCalendarGroup{
	return [[MSOCalendarGroupFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSOContactFolderFetcher*) asContactFolder{
	return [[MSOContactFolderFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
	
@end