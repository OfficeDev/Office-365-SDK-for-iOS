/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryOAuth2PermissionGrantFetcher.h"


/**
* The implementation file for type MSDirectoryOAuth2PermissionGrantFetcher.
*/


@implementation MSDirectoryOAuth2PermissionGrantFetcher
-(MSDirectoryOAuth2PermissionGrantOperations*) getOperations{
	return [[MSDirectoryOAuth2PermissionGrantOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDirectoryOAuth2PermissionGrant class]];
}


@end