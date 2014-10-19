/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFileAttachmentFetcher.h"


/**
* The implementation file for type MSOFileAttachmentFetcher.
*/

@implementation MSOFileAttachmentFetcher

-(MSOFileAttachmentOperations*) getOperations{
	return [[MSOFileAttachmentOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOFileAttachment class]];
}

@end