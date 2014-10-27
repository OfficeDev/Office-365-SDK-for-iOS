/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookFileAttachmentFetcher.h"


/**
* The implementation file for type MSOutlookFileAttachmentFetcher.
*/


@implementation MSOutlookFileAttachmentFetcher
-(MSOutlookFileAttachmentOperations*) getOperations{
	return [[MSOutlookFileAttachmentOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOutlookFileAttachment class]];
}


@end