//
//  UserFetcher.m
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "UserFetcher.h"
#import "FolderFetcher.h"
#import "ODataCollectionFetcher.h"
#import "Message.h"
#import "FolderCollectionFetcher.h"

@implementation UserFetcher

-(UserOperations*) getOperations{
    return (UserOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    
    return [super initWith:urlComponent :parent :[User class] :[UserOperations class]];
}

-(FolderFetcher*) getFolders{
    return [[FolderFetcher alloc] initWith:@"Folders" :self :[Message class] : [FolderOperations class]];
}


-(FolderCollectionFetcher*) getFolders{
    return [[FolderCollectionFetcher alloc] initWith:@"Folders" :self :[Message class] : [FolderCollectionOperations class]];
}

@end
