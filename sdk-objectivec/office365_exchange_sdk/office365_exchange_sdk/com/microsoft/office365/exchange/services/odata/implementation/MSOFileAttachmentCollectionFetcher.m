/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFileAttachmentCollectionFetcher.h"

@implementation MSOFileAttachmentCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOFileAttachment class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<MSOFileAttachment> *fileAttachment, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(NSURLSessionDataTask*)add:(MSOFileAttachment* )entity :(void (^)(MSOFileAttachment *fileAttachment, NSError *e))callback{
	return nil;
}

-(MSOFileAttachmentFetcher*)getById:(NSString *)Id{
	return nil;
}
@end
