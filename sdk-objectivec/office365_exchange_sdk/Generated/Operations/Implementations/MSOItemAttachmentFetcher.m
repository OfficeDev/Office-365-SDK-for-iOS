/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOItemAttachmentFetcher.h"
#import "MSOItemFetcher.h"


/**
* The implementation file for type MSOItemAttachmentFetcher.
*/


@implementation MSOItemAttachmentFetcher
-(MSOItemAttachmentOperations*) getOperations{
	return [[MSOItemAttachmentOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOItemAttachment class]];
}

-(MSOItemFetcher*) getItem{
	 return [[MSOItemFetcher alloc] initWith:@"Item" :self : [MSOItem class]];
}


@end