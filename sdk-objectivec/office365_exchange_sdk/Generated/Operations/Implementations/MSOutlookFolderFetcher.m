/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookFolderFetcher.h"
#import "MSOutlookFolderCollectionFetcher.h"
#import "MSOutlookMessageCollectionFetcher.h"


/**
* The implementation file for type MSOutlookFolderFetcher.
*/


@implementation MSOutlookFolderFetcher
-(MSOutlookFolderOperations*) getOperations{
	return [[MSOutlookFolderOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOutlookFolder class]];
}

-(MSOutlookFolderCollectionFetcher*) getChildFolders{
    return [[MSOutlookFolderCollectionFetcher alloc] initWith:@"ChildFolders" :self : [MSOutlookFolder class]];
}

-(MSOutlookMessageCollectionFetcher*) getMessages{
    return [[MSOutlookMessageCollectionFetcher alloc] initWith:@"Messages" :self : [MSOutlookMessage class]];
}


@end