/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSItemAttachmentFetcher.h"
#import "MSItemFetcher.h"


/**
* The implementation file for type MSItemAttachmentFetcher.
*/


@implementation MSItemAttachmentFetcher
-(MSItemAttachmentOperations*) getOperations{
	return [[MSItemAttachmentOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSItemAttachment class]];
}

-(MSItemFetcher*) getItem{
	 return [[MSItemFetcher alloc] initWith:@"Item" :self : [MSItem class]];
}


@end