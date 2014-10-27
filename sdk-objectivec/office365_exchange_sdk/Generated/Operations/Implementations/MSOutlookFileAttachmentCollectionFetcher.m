/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookFileAttachmentCollectionFetcher.h"

/**
* The implementation file for type MSOutlookFileAttachmentCollectionFetcher.
*/

@implementation MSOutlookFileAttachmentCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookFileAttachment class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookFileAttachment* )entity :(void (^)(MSOutlookFileAttachment *fileAttachment, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookFileAttachmentFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookFileAttachmentFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookFileAttachment class]];
}
@end
