/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSContactFolderCollectionFetcher.h"

/**
* The implementation file for type MSContactFolderCollectionFetcher.
*/

@implementation MSContactFolderCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSContactFolder class]];
}

-(NSURLSessionDataTask*)add:(MSContactFolder* )entity :(void (^)(MSContactFolder *contactFolder, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSContactFolderFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSContactFolderFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSContactFolder class]];
}
@end
