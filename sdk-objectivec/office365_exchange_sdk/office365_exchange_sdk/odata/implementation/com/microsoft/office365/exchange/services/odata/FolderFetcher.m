/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "FolderFetcher.h"

@implementation FolderFetcher

-(FolderOperations*) getOperations{
    return (FolderOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent{
    return [super initWith:urlComponent :parent :[Folder class] :[FolderOperations class]];
}
-(FolderCollectionFetcher*) getChildFolders{
    return nil;//[[FolderCollectionFetcher alloc] initWith:@"ChildFolders" :self :[super.class classForClassName:@"Folder"]  : [FolderCollectionOperations class]];
}
-(MessageCollectionFetcher*) getMessages{
    
    return [[MessageCollectionFetcher alloc] initWith:[[NSString alloc]initWithFormat:@"%@/%@", @"Me", @"Messages" ] :self :[Message class]  : [MessageCollectionOperations class]];
    
    
}

-(NSURLSessionDataTask *)execute:(void (^)(Folder *folder, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}
@end