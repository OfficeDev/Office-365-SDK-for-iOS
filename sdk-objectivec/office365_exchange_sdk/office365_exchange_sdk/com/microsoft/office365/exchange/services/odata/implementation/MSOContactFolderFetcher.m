/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOContactFolderFetcher.h"
#import "MSOContactCollectionFetcher.h"
#import "MSOContactFolderCollectionFetcher.h"


@implementation MSOContactFolderFetcher

-(MSOContactFolderOperations*) getOperations{
    return (MSOContactFolderOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOContactFolder class]];
}

-(NSURLSessionDataTask *)oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb :(void (^)(id<MSOResponse>, NSError *))callback{
    
   return [self.Parent oDataExecute:path :content :verb :callback];
}

-(NSURLSessionDataTask *)execute:(void (^)(MSOContactFolder *mSOContactFolder, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(MSOContactCollectionFetcher*) getContacts{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"Contacts" ];
  
    return [[MSOContactCollectionFetcher alloc] initWith:path :self : [MSOContact class]];
}

-(MSOContactFolderCollectionFetcher*) getChildFolders{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"ChildFolders" ];
  
    return [[MSOContactFolderCollectionFetcher alloc] initWith:path :self : [MSOContactFolder class]];
}

@end