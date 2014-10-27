/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookContactFolderFetcher.h"
#import "MSOutlookContactCollectionFetcher.h"
#import "MSOutlookContactFolderCollectionFetcher.h"


/**
* The implementation file for type MSOutlookContactFolderFetcher.
*/


@implementation MSOutlookContactFolderFetcher
-(MSOutlookContactFolderOperations*) getOperations{
	return [[MSOutlookContactFolderOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOutlookContactFolder class]];
}

-(MSOutlookContactCollectionFetcher*) getContacts{
    return [[MSOutlookContactCollectionFetcher alloc] initWith:@"Contacts" :self : [MSOutlookContact class]];
}

-(MSOutlookContactFolderCollectionFetcher*) getChildFolders{
    return [[MSOutlookContactFolderCollectionFetcher alloc] initWith:@"ChildFolders" :self : [MSOutlookContactFolder class]];
}


@end