//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@interface Folder : Entity	

@property NSString *ParentFolderId;
@property NSString *DisplayName;
@property int ChildFolderCount;

@end