//
//  MessageCollectionFetcher.m
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/8/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageCollectionFetcher.h"

@implementation MessageCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent{
    return self;
}
-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent :(Class)clazz :(Class)operationClazz{
    return [super initWith:urlComponent :parent :clazz :operationClazz];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<Message> *messages, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}
@end