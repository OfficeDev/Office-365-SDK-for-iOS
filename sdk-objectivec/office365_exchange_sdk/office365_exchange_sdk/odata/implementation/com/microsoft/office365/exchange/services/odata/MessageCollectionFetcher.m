//
//  MessageCollectionFetcher.m
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/8/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageCollectionFetcher.h"
#import "MessageCollectionOperations.h"
#import "MessageFetcher.h"

@implementation MessageCollectionFetcher

@synthesize Parent;
-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent{
    self.Parent = parent;
    return [super initWith:urlComponent :parent :[Message class] :[MessageCollectionOperations class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<Message> *messages, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(MessageFetcher*)getById:(NSString *)Id{
    [super getById:Id];
    return [[MessageFetcher alloc] initWith:@"" : self :[Message class] :[MessageOperations class]];
}

-(NSURLSessionDataTask *)add:(Message* )entity :(void (^)(Message*, NSError *e))callback{
    return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

@end