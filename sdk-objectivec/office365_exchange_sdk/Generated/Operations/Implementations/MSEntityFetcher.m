/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSEntityFetcher.h"


/**
* The implementation file for type MSEntityFetcher.
*/


@implementation MSEntityFetcher
-(MSEntityOperations*) getOperations{
	return [[MSEntityOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSEntity class]];
}

	
-(MSUserFetcher*) asUser{
	return [[MSUserFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSUser class]];
}	
		
-(MSFolderFetcher*) asFolder{
	return [[MSFolderFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSFolder class]];
}	
		
-(MSItemFetcher*) asItem{
	return [[MSItemFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSItem class]];
}	
		
-(MSAttachmentFetcher*) asAttachment{
	return [[MSAttachmentFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSAttachment class]];
}	
		
-(MSCalendarFetcher*) asCalendar{
	return [[MSCalendarFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSCalendar class]];
}	
		
-(MSCalendarGroupFetcher*) asCalendarGroup{
	return [[MSCalendarGroupFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSCalendarGroup class]];
}	
		
-(MSContactFolderFetcher*) asContactFolder{
	return [[MSContactFolderFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSContactFolder class]];
}	
	
@end