/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFileAttachmentFetcher.h"


/**
* The implementation file for type MSFileAttachmentFetcher.
*/


@implementation MSFileAttachmentFetcher
-(MSFileAttachmentOperations*) getOperations{
	return [[MSFileAttachmentOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSFileAttachment class]];
}


@end