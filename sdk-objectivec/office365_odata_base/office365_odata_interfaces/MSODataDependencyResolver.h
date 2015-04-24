/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@protocol MSODataHttpTransport;
@protocol MSODataLogger;
@protocol MSODataJsonSerializer;
@protocol MSODataCredentials;
@protocol MSODataRequest;

@protocol MSODataDependencyResolver

@required

@property (strong, atomic, readwrite) id<MSODataCredentials> credentials;
@property (strong, nonatomic, readonly) id<MSODataHttpTransport> httpTransport;
@property (strong, nonatomic, readonly) id<MSODataLogger> logger;
@property (strong, nonatomic, readonly) id<MSODataJsonSerializer> jsonSerializer;

- (id<MSODataRequest>)createODataRequest;
- (NSString *)getPlatformUserAgent:(NSString *)productName;

@end
