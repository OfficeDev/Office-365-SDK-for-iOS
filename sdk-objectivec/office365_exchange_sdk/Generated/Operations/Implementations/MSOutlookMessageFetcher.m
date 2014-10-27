/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookMessageFetcher.h"
#import "MSOutlookAttachmentCollectionFetcher.h"


/**
* The implementation file for type MSOutlookMessageFetcher.
*/


@implementation MSOutlookMessageFetcher
-(MSOutlookMessageOperations*) getOperations{
	return [[MSOutlookMessageOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOutlookMessage class]];
}

-(MSOutlookAttachmentCollectionFetcher*) getAttachments{
    return [[MSOutlookAttachmentCollectionFetcher alloc] initWith:@"Attachments" :self : [MSOutlookAttachment class]];
}


@end