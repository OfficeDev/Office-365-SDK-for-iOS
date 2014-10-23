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
	return [[MSUserFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSFolderFetcher*) asFolder{
	return [[MSFolderFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSItemFetcher*) asItem{
	return [[MSItemFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSAttachmentFetcher*) asAttachment{
	return [[MSAttachmentFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSCalendarFetcher*) asCalendar{
	return [[MSCalendarFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSCalendarGroupFetcher*) asCalendarGroup{
	return [[MSCalendarGroupFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSContactFolderFetcher*) asContactFolder{
	return [[MSContactFolderFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
	
@end