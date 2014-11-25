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

#import "MSOOutlookFolderCollectionFetcher.h"

/**
* The implementation file for type MSOOutlookFolderCollectionFetcher.
*/

@implementation MSOOutlookFolderCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSOOutlookFolder class]];
}

-(NSURLSessionDataTask*)addEntity:(MSOOutlookFolder*)entity withCallback:(void (^)(MSOOutlookFolder *folder, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOOutlookFolderFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOOutlookFolderFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSOOutlookFolder class]];
}
@end