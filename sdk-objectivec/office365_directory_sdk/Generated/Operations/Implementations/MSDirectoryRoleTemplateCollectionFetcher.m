/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryRoleTemplateCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryRoleTemplateCollectionFetcher.
*/

@implementation MSDirectoryRoleTemplateCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryRoleTemplate class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryRoleTemplate* )entity :(void (^)(MSDirectoryRoleTemplate *directoryRoleTemplate, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryRoleTemplateFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryRoleTemplateFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryRoleTemplate class]];
}
@end
