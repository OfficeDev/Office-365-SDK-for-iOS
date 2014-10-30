/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSOutlookFileAttachmentCollectionFetcher.h"

/**
* The implementation file for type MSOutlookFileAttachmentCollectionFetcher.
*/

@implementation MSOutlookFileAttachmentCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;{
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
