/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSODataHttpVerb.h"

@protocol MSODataURL;

@protocol MSODataRequest

@required

@property (copy, nonatomic, readwrite) NSData *content;
@property (strong, nonatomic, readwrite) NSInputStream *streamContent;
@property (copy, nonatomic, readonly) NSMutableDictionary *headers;
@property (copy, nonatomic, readonly) NSMutableArray *options;
@property (copy, nonatomic, readwrite) id<MSODataURL> url;
@property (nonatomic, readwrite) MSODataHttpVerb verb;
@property (nonatomic, readwrite) NSInteger size;

- (void)addHeaderWithName:(NSString *)name value:(NSString *)value;
- (void)addOptionWithName:(NSString *)name value:(NSString *)value;
/*
- (void)removeHeaderWithName:(NSString *)name;
*/

@end