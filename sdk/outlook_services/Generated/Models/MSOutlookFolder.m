/*******************************************************************************
**NOTE** This code was generated by a tool and will occasionally be
overwritten. We welcome comments and issues regarding this code; they will be
addressed in the generation tool. If you wish to submit pull requests, please
do so for the templates in that tool.

This code was generated by Vipr (https://github.com/microsoft/vipr) using
the T4TemplateWriter (https://github.com/msopentech/vipr-t4templatewriter).

Copyright (c) Microsoft Open Technologies, Inc. All Rights Reserved.
Licensed under the Apache License 2.0; see LICENSE in the source repository
root for authoritative license information.﻿
******************************************************************************/

#import "MSOutlookModels.h"

/**
* The implementation file for type MSOutlookFolder.
*/

@implementation MSOutlookFolder	

@synthesize odataType = _odataType;
@synthesize ParentFolderId = _parentFolderId;
@synthesize DisplayName = _displayName;
@synthesize ChildFolderCount = _childFolderCount;
@synthesize ChildFolders = _childFolders;
@synthesize Messages = _messages;

- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.OutlookServices.Folder";
		_childFolders = [[NSMutableArray alloc] initWithCollectionType:@"MSOutlookFolder"];
		_messages = [[NSMutableArray alloc] initWithCollectionType:@"MSOutlookMessage"];
    }

	return self;
}

- (void)setParentFolderId:(NSString *) parentFolderId {
    _parentFolderId = parentFolderId;
	[self valueChanged:parentFolderId forProperty:@"ParentFolderId"];
}
    
- (void)setDisplayName:(NSString *) displayName {
    _displayName = displayName;
	[self valueChanged:displayName forProperty:@"DisplayName"];
}
    
- (void)setChildFolderCount:(int ) childFolderCount {
    _childFolderCount = childFolderCount;
    [self valueChangedForInt:childFolderCount forProperty:@"ChildFolderCount"];
}
    
- (void)setChildFolders:(NSMutableArray *) childFolders {
    _childFolders = childFolders;
	[self valueChanged:childFolders forProperty:@"ChildFolders"];
}
    
- (void)setMessages:(NSMutableArray *) messages {
    _messages = messages;
	[self valueChanged:messages forProperty:@"Messages"];
}
    
@end