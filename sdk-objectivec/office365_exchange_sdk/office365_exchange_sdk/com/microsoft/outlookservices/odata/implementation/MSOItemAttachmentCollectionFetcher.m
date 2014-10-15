/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOItemAttachmentCollectionFetcher.h"

/**
* The implementation file for type MSOItemAttachmentCollectionFetcher.
*/

@implementation MSOItemAttachmentCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOItemAttachment class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<MSOItemAttachment> *itemAttachment, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(NSURLSessionDataTask*)add:(MSOItemAttachment* )entity :(void (^)(MSOItemAttachment *itemAttachment, NSError *e))callback{
	return nil;
}

-(MSOItemAttachmentFetcher*)getById:(NSString *)Id{
	return nil;
}
@end
