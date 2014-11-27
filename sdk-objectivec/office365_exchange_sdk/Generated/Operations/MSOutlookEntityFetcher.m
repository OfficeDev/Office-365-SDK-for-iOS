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

#import "MSOutlookEntityFetcher.h"


/**
* The implementation file for type MSOutlookEntityFetcher.
*/


@implementation MSOutlookEntityFetcher

-(MSOutlookEntityOperations*) getOperations{
	return [[MSOutlookEntityOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOutlookEntity class]];
}

-(NSURLSessionDataTask*) updateEntity:(id)entity withCallback:(void (^)(MSOutlookEntity*, NSError * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionDataTask*) deleteEntity:(void (^)(int status, NSError * error))callback{
	return [super delete:callback];
}



	
-(MSOutlookUserFetcher*) asUser{
	return [[MSOutlookUserFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOutlookFolderFetcher*) asFolder{
	return [[MSOutlookFolderFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOutlookItemFetcher*) asItem{
	return [[MSOutlookItemFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOutlookAttachmentFetcher*) asAttachment{
	return [[MSOutlookAttachmentFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOutlookCalendarFetcher*) asCalendar{
	return [[MSOutlookCalendarFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOutlookCalendarGroupFetcher*) asCalendarGroup{
	return [[MSOutlookCalendarGroupFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOutlookContactFolderFetcher*) asContactFolder{
	return [[MSOutlookContactFolderFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}@end