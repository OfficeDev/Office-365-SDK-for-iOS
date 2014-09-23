
//
//  BaseClient.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Credentials.h"

@interface BaseClient : NSObject

@property (nonatomic) Credentials *Credential;
@property (nonatomic) NSString *Url;
@property (nonatomic) NSMutableData *data;

- (id)initWithUrl:(NSString *)url credentials:(Credentials *)credentials;
- (NSMutableArray *)parseData:(NSData *)data;

@end