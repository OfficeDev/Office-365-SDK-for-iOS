/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFileAttachmentCollectionFetcher.h"

/**
* The implementation file for type MSFileAttachmentCollectionFetcher.
*/

@implementation MSFileAttachmentCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSFileAttachment class]];
}

-(NSURLSessionDataTask*)add:(MSFileAttachment* )entity :(void (^)(MSFileAttachment *fileAttachment, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSFileAttachmentFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSFileAttachmentFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSFileAttachment class]];
}
@end
