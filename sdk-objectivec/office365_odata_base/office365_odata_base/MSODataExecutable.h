/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataDependencyResolver.h"
#import "MSODataReadable.h"

@protocol MSODataExecutable<MSODataReadable>

@optional

-(id<MSODataDependencyResolver>) getResolver;
-(NSURLSessionDataTask *)oDataExecuteWithRequest:(id<MSODataRequest>) request callback:  (void (^)(id<MSODataResponse>, MSODataException *))callback;

@required

@property NSString* UrlComponent;
@property id<MSODataExecutable> Parent;

-(NSDictionary*)getCustomParameters;

@end

@interface MSODataExecutable : NSObject<MSODataExecutable>

@property NSString* UrlComponent;
@property id<MSODataExecutable> Parent;
@property NSMutableDictionary* CustomParameters;

@end