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

#import "MSOutlookFolderCollectionFetcher.h"

/**
* The implementation file for type MSOutlookFolderCollectionFetcher.
*/

@implementation MSOutlookFolderCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSOutlookFolder class]];
}

-(NSURLSessionDataTask*)addFolder:(MSOutlookFolder*)entity withCallback:(void (^)(MSOutlookFolder *folder, MSODataException *e))callback{
	
	return [super add:entity :^(id r, MSODataException *e) {
        callback(r,e);
    }];
}

-(MSOutlookFolderFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookFolderFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSOutlookFolder class]];
}
@end