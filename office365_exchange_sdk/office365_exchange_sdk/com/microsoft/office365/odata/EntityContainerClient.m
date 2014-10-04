//
//  EntityContainerClient.m
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "EntityContainerClient.h"
#import "FolderFetcher.h"

@implementation EntityContainerClient

-(id)initWit : (NSString *)url : (DependencyResolver*) resolver{
    return [super initWit:url :resolver];
}

-(FolderFetcher*) getMe{
    return nil;
}
/*
public UserFetcher getMe() {
    return new UserFetcher("Me", this);
}
public UserFetcher getUsers() {
    return new UserFetcher("Users", this);
}*/
@end