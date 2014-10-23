/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSAttachmentCollectionFetcher.h"

/**
* The implementation file for type MSAttachmentCollectionFetcher.
*/

@implementation MSAttachmentCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSAttachment class]];
}

-(NSURLSessionDataTask*)add:(MSAttachment* )entity :(void (^)(MSAttachment *attachment, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSAttachmentFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSAttachmentFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSAttachment class]];
}
@end
