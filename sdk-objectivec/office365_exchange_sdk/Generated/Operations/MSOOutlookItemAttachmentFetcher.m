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

#import "MSOOutlookItemAttachmentFetcher.h"
#import "MSOOutlookItemFetcher.h"


/**
* The implementation file for type MSOOutlookItemAttachmentFetcher.
*/


@implementation MSOOutlookItemAttachmentFetcher

-(MSOOutlookItemAttachmentOperations*) getOperations{
	return [[MSOOutlookItemAttachmentOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOOutlookItemAttachment class]];
}


-(MSOOutlookItemFetcher*) getItem{
	 return [[MSOOutlookItemFetcher alloc] initWithUrl:@"Item" parent:self andEntityClass: [MSOOutlookItem class]];
}


@end