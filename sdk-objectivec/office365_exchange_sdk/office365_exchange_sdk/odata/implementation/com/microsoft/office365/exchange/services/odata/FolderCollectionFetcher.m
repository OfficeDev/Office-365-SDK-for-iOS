//
//  FolderCollectionFetcher.m
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/7/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FolderCollectionFetcher.h"
#import "FolderCollectionOperations.h"

@implementation FolderCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent{
    return [super initWith:urlComponent :parent :[Folder class] :[FolderCollectionOperations class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<Folder> * folder, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}
@end