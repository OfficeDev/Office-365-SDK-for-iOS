/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookAttachmentCollectionFetcher.h"

/**
* The implementation file for type MSOutlookAttachmentCollectionFetcher.
*/

@implementation MSOutlookAttachmentCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookAttachment class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookAttachment* )entity :(void (^)(MSOutlookAttachment *attachment, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookAttachmentFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookAttachmentFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookAttachment class]];
}
@end
