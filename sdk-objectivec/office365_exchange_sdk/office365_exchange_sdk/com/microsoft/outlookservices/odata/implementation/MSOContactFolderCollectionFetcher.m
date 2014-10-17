/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOContactFolderCollectionFetcher.h"

/**
* The implementation file for type MSOContactFolderCollectionFetcher.
*/

@implementation MSOContactFolderCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOContactFolder class]];
}

-(NSURLSessionDataTask*)add:(MSOContactFolder* )entity :(void (^)(MSOContactFolder *contactFolder, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOContactFolderFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOContactFolderFetcher alloc] initWith:@"" : self :[MSOContactFolder class]];
}
@end
