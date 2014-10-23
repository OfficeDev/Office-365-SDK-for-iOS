/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSMessageFetcher.h"
#import "MSAttachmentCollectionFetcher.h"


/**
* The implementation file for type MSMessageFetcher.
*/


@implementation MSMessageFetcher
-(MSMessageOperations*) getOperations{
	return [[MSMessageOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSMessage class]];
}

-(MSAttachmentCollectionFetcher*) getAttachments{
    return [[MSAttachmentCollectionFetcher alloc] initWith:@"Attachments" :self : [MSAttachment class]];
}


@end