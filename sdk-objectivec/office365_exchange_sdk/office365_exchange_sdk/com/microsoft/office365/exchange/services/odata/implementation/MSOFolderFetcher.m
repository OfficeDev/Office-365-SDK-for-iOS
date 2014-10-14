/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFolderFetcher.h"
#import "MSOFolderCollectionFetcher.h"
#import "MSOMessageCollectionFetcher.h"


@implementation MSOFolderFetcher

-(MSOFolderOperations*) getOperations{
    return (MSOFolderOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOFolder class]];
}

-(NSURLSessionDataTask *)oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb :(void (^)(id<MSOResponse>, NSError *))callback{
    
   return [self.Parent oDataExecute:path :content :verb :callback];
}

-(NSURLSessionDataTask *)execute:(void (^)(MSOFolder *mSOFolder, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(MSOFolderCollectionFetcher*) getChildFolders{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"ChildFolders" ];
  
    return [[MSOFolderCollectionFetcher alloc] initWith:path :self : [MSOFolder class]];
}

-(MSOMessageCollectionFetcher*) getMessages{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"Messages" ];
  
    return [[MSOMessageCollectionFetcher alloc] initWith:path :self : [MSOMessage class]];
}

@end