/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOAuth2PermissionGrantFetcher.h"


/**
* The implementation file for type MSOAuth2PermissionGrantFetcher.
*/


@implementation MSOAuth2PermissionGrantFetcher
-(MSOAuth2PermissionGrantOperations*) getOperations{
	return [[MSOAuth2PermissionGrantOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOAuth2PermissionGrant class]];
}


@end