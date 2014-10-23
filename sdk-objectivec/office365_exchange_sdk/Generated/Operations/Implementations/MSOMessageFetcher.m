/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOMessageFetcher.h"
#import "MSOAttachmentCollectionFetcher.h"


/**
* The implementation file for type MSOMessageFetcher.
*/


@implementation MSOMessageFetcher
-(MSOMessageOperations*) getOperations{
	return [[MSOMessageOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOMessage class]];
}

-(MSOAttachmentCollectionFetcher*) getAttachments{
    return [[MSOAttachmentCollectionFetcher alloc] initWith:@"Attachments" :self : [MSOAttachment class]];
}


@end