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

#import "MSOOutlookContactFolderCollectionFetcher.h"

/**
* The implementation file for type MSOOutlookContactFolderCollectionFetcher.
*/

@implementation MSOOutlookContactFolderCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSOOutlookContactFolder class]];
}

-(NSURLSessionDataTask*)addEntity:(MSOOutlookContactFolder*)entity withCallback:(void (^)(MSOOutlookContactFolder *contactFolder, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOOutlookContactFolderFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOOutlookContactFolderFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSOOutlookContactFolder class]];
}
@end