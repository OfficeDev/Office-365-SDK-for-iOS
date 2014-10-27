/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookItemAttachmentCollectionFetcher.h"

/**
* The implementation file for type MSOutlookItemAttachmentCollectionFetcher.
*/

@implementation MSOutlookItemAttachmentCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookItemAttachment class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookItemAttachment* )entity :(void (^)(MSOutlookItemAttachment *itemAttachment, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookItemAttachmentFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookItemAttachmentFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookItemAttachment class]];
}
@end
