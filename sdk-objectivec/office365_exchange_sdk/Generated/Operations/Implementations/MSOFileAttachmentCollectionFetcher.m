/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFileAttachmentCollectionFetcher.h"

/**
* The implementation file for type MSOFileAttachmentCollectionFetcher.
*/

@implementation MSOFileAttachmentCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOFileAttachment class]];
}

-(NSURLSessionDataTask*)add:(MSOFileAttachment* )entity :(void (^)(MSOFileAttachment *fileAttachment, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOFileAttachmentFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOFileAttachmentFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOFileAttachment class]];
}
@end
