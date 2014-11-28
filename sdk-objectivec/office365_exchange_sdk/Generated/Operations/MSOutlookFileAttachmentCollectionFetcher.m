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

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSOutlookFileAttachment class]];
}

-(NSURLSessionDataTask*)addFileAttachment:(MSOutlookFileAttachment*)entity withCallback:(void (^)(MSOutlookFileAttachment *fileAttachment, MSODataException *e))callback{
	
	return [super add:entity :^(id r, MSODataException *e) {
        callback(r,e);
    }];
}

-(MSOutlookFileAttachmentFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookFileAttachmentFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSOutlookFileAttachment class]];
}
@end