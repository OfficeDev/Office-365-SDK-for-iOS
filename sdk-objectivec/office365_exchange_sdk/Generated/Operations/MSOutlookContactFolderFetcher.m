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

#import "MSOutlookContactFolderFetcher.h"
#import "MSOutlookContactCollectionFetcher.h"
#import "MSOutlookContactFolderCollectionFetcher.h"


/**
* The implementation file for type MSOutlookContactFolderFetcher.
*/


@implementation MSOutlookContactFolderFetcher

-(MSOutlookContactFolderOperations*) getOperations{
	return [[MSOutlookContactFolderOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOutlookContactFolder class]];
}


-(MSOutlookContactCollectionFetcher*) getContacts{
    return [[MSOutlookContactCollectionFetcher alloc] initWithUrl:@"Contacts" parent:self andEntityClass:[MSOutlookContact class]];
}


-(MSOutlookContactFolderCollectionFetcher*) getChildFolders{
    return [[MSOutlookContactFolderCollectionFetcher alloc] initWithUrl:@"ChildFolders" parent:self andEntityClass:[MSOutlookContactFolder class]];
}


@end