/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MSOFolderFetcher.h"
#import "MSOFolderCollectionFetcher.h"
#import "MSOMessageCollectionFetcher.h"


/**
* The implementation file for type MSOFolderFetcher.
*/

@implementation MSOFolderFetcher
-(MSOFolderOperations*) getOperations{
	return [[MSOFolderOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOFolder class]];
}

-(MSOFolderCollectionFetcher*) getChildFolders{
    return [[MSOFolderCollectionFetcher alloc] initWith:@"ChildFolders" :self : [MSOFolder class]];
}

-(MSOMessageCollectionFetcher*) getMessages{
    return [[MSOMessageCollectionFetcher alloc] initWith:@"Messages" :self : [MSOMessage class]];
}

@end