/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookItemAttachmentFetcher.h"
#import "MSOutlookItemFetcher.h"


/**
* The implementation file for type MSOutlookItemAttachmentFetcher.
*/


@implementation MSOutlookItemAttachmentFetcher
-(MSOutlookItemAttachmentOperations*) getOperations{
	return [[MSOutlookItemAttachmentOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOutlookItemAttachment class]];
}

-(MSOutlookItemFetcher*) getItem{
	 return [[MSOutlookItemFetcher alloc] initWith:@"Item" :self : [MSOutlookItem class]];
}


@end