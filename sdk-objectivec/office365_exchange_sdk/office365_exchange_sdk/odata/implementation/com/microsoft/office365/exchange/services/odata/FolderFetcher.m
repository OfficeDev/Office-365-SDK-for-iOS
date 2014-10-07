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

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    
    return [super initWith:urlComponent :parent :[Folder class] :[FolderOperations class]];
}
-(FolderCollectionFetcher*) getChildFolders{
    return [[FolderCollectionFetcher alloc] initWith:@"ChildFolders" :self :[Folder class] : [FolderCollectionOperations class]];
}
-(MessageCollectionFetcher*) getMessages{
    return [[MessageCollectionFetcher alloc] initWith:@"Messages" :self :[Message class] : [MessageCollectionOperations class]];
}
@end