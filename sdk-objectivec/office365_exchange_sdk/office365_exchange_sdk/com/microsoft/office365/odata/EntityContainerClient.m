//
//  EntityContainerClient.m
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "EntityContainerClient.h"
#import "FolderFetcher.h"
#import "UserFetcher.h"
#import "FolderCollectionFetcher.h"
#import "Folder.h"
#import "User.h"

@implementation EntityContainerClient

-(id)initWit : (NSString *)url : (DependencyResolver*) resolver{
    return [super initWith:url :resolver];
}

-(FolderFetcher*) getMe{
    return [[FolderFetcher alloc] initWith:@"Me" :self :[Folder class] :[UserOperations class]];
    
}

-(UserFetcher*)getUsers{
    return [[UserFetcher alloc] initWith:@"Users" :self : [User class] :[UserOperations class]];
}

@end