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

#import "MSOOutlookEntityFetcher.h"


/**
* The implementation file for type MSOOutlookEntityFetcher.
*/


@implementation MSOOutlookEntityFetcher

-(MSOOutlookEntityOperations*) getOperations{
	return [[MSOOutlookEntityOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOOutlookEntity class]];
}



	
-(MSOOutlookUserFetcher*) asUser{
	return [[MSOOutlookUserFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOOutlookFolderFetcher*) asFolder{
	return [[MSOOutlookFolderFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOOutlookItemFetcher*) asItem{
	return [[MSOOutlookItemFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOOutlookAttachmentFetcher*) asAttachment{
	return [[MSOOutlookAttachmentFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOOutlookCalendarFetcher*) asCalendar{
	return [[MSOOutlookCalendarFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOOutlookCalendarGroupFetcher*) asCalendarGroup{
	return [[MSOOutlookCalendarGroupFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOOutlookContactFolderFetcher*) asContactFolder{
	return [[MSOOutlookContactFolderFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}@end