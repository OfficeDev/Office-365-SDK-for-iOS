/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOAttachmentCollectionFetcher.h"

/**
* The implementation file for type MSOAttachmentCollectionFetcher.
*/

@implementation MSOAttachmentCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOAttachment class]];
}

-(NSURLSessionDataTask*)add:(MSOAttachment* )entity :(void (^)(MSOAttachment *attachment, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOAttachmentFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOAttachmentFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOAttachment class]];
}
@end
