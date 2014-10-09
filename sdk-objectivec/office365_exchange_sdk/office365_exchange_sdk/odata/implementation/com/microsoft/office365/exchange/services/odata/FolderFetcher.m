/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "FolderFetcher.h"

@interface FolderFetcher()

@property id<ODataExecutable> parent;

@end

@implementation FolderFetcher

-(FolderOperations*) getOperations{
    return (FolderOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent{
    
    return [super initWith:urlComponent :parent :[super.class classForClassName:@"Folder"] :[FolderOperations class]];
}
-(FolderCollectionFetcher*) getChildFolders{
    return nil;//[[FolderCollectionFetcher alloc] initWith:@"ChildFolders" :self :[super.class classForClassName:@"Folder"]  : [FolderCollectionOperations class]];
}
-(MessageCollectionFetcher*) getMessages{
    
    return [[MessageCollectionFetcher alloc] initWith:[[NSString alloc]initWithFormat:@"%@/%@", @"Me", @"Messages" ] :self :[super.class classForClassName:@"Message"]  : [super.class classForClassName:@"MessageCollectionOperations"]];
    
    
}
@end