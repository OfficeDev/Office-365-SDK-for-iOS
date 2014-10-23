/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSItemAttachmentCollectionFetcher.h"

/**
* The implementation file for type MSItemAttachmentCollectionFetcher.
*/

@implementation MSItemAttachmentCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSItemAttachment class]];
}

-(NSURLSessionDataTask*)add:(MSItemAttachment* )entity :(void (^)(MSItemAttachment *itemAttachment, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSItemAttachmentFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSItemAttachmentFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSItemAttachment class]];
}
@end
