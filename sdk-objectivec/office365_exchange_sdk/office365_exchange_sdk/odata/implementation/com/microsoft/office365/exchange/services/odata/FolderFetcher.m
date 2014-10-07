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
    
    return [super initWith:urlComponent :parent :[super.class classForClassName:@"Folder"] :[FolderOperations class]];
}
-(FolderCollectionFetcher*) getChildFolders{
    return nil;//[[FolderCollectionFetcher alloc] initWith:@"ChildFolders" :self :[super.class classForClassName:@"Folder"]  : [FolderCollectionOperations class]];
}
-(MessageCollectionFetcher*) getMessages{
    return nil;//[[MessageCollectionFetcher alloc] initWith:@"Messages" :self :[super.class classForClassName:@"Message"]  : [MessageCollectionOperations class]];
}
@end