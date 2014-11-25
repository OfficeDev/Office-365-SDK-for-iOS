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

#import "MSOOutlookContactFolderFetcher.h"
#import "MSOOutlookContactCollectionFetcher.h"
#import "MSOOutlookContactFolderCollectionFetcher.h"


/**
* The implementation file for type MSOOutlookContactFolderFetcher.
*/


@implementation MSOOutlookContactFolderFetcher

-(MSOOutlookContactFolderOperations*) getOperations{
	return [[MSOOutlookContactFolderOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOOutlookContactFolder class]];
}


-(MSOOutlookContactCollectionFetcher*) getContacts{
    return [[MSOOutlookContactCollectionFetcher alloc] initWithUrl:@"Contacts" parent:self andEntityClass:[MSOOutlookContact class]];
}


-(MSOOutlookContactFolderCollectionFetcher*) getChildFolders{
    return [[MSOOutlookContactFolderCollectionFetcher alloc] initWithUrl:@"ChildFolders" parent:self andEntityClass:[MSOOutlookContactFolder class]];
}


@end