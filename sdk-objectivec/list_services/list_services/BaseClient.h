/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Credentials.h"

@interface BaseClient : NSObject

@property (nonatomic) Credentials *Credential;
@property (nonatomic) NSString *Url;
@property (nonatomic) NSMutableData *data;

- (id)initWithUrl:(NSString *)url credentials:(Credentials *)credentials;
- (NSMutableArray *)parseData:(NSData *)data;

@end