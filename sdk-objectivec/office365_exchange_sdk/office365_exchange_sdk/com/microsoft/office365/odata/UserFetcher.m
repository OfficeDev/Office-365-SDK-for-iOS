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

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    return [[super init]initWith:urlComponent :parent :[User class] :[UserOperations class]];
}

-(FolderFetcher*) getRootFolder {
    return [[FolderFetcher alloc] initWith:@"RootFolder" :self];
}

-(FolderCollectionFetcher*) getFolders{
    return [[FolderCollectionFetcher alloc] initWith:@"Folders" :self :[Message class] : [FolderCollectionOperations class]];
}

@end
