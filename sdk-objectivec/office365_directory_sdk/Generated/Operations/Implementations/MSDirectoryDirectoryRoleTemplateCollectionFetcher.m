/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDirectoryRoleTemplateCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryDirectoryRoleTemplateCollectionFetcher.
*/

@implementation MSDirectoryDirectoryRoleTemplateCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryDirectoryRoleTemplate class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryDirectoryRoleTemplate* )entity :(void (^)(MSDirectoryDirectoryRoleTemplate *directoryRoleTemplate, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryDirectoryRoleTemplateFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryDirectoryRoleTemplateFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryDirectoryRoleTemplate class]];
}
@end
