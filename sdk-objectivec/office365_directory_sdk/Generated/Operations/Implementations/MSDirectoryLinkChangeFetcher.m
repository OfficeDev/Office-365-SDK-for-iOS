/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryLinkChangeFetcher.h"


/**
* The implementation file for type MSDirectoryLinkChangeFetcher.
*/


@implementation MSDirectoryLinkChangeFetcher
-(MSDirectoryLinkChangeOperations*) getOperations{
	return [[MSDirectoryLinkChangeOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDirectoryLinkChange class]];
}


@end