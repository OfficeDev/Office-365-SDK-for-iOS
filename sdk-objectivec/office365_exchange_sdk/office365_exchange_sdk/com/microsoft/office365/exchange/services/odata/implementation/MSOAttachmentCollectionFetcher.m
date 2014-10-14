/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOAttachmentCollectionFetcher.h"

@implementation MSOAttachmentCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOAttachment class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<MSOAttachment> *attachment, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(NSURLSessionDataTask*)add:(MSOAttachment* )entity :(void (^)(MSOAttachment *attachment, NSError *e))callback{
	return nil;
}

-(MSOAttachmentFetcher*)getById:(NSString *)Id{
	return nil;
}
@end
