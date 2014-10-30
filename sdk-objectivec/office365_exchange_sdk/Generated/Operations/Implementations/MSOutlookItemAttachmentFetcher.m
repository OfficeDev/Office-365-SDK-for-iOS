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

#import "MSOutlookItemAttachmentFetcher.h"
#import "MSOutlookItemFetcher.h"


/**
* The implementation file for type MSOutlookItemAttachmentFetcher.
*/


@implementation MSOutlookItemAttachmentFetcher
-(MSOutlookItemAttachmentOperations*) getOperations{
	return [[MSOutlookItemAttachmentOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOutlookItemAttachment class]];
}

-(MSOutlookItemFetcher*) getItem{
	 return [[MSOutlookItemFetcher alloc] initWith:@"Item" :self : [MSOutlookItem class]];
}


@end