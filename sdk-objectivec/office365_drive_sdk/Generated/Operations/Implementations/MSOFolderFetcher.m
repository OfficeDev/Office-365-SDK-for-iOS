/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MSOFolderFetcher.h"
#import "MSOItemCollectionFetcher.h"


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

-(MSOItemCollectionFetcher*) getchildren{
    return [[MSOItemCollectionFetcher alloc] initWith:@"children" :self : [MSOItem class]];
}

@end