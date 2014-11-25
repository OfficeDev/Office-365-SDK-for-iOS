/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataDependencyResolver.h"

@protocol MSODataReadable

@optional

-(id<MSODataDependencyResolver>) getResolver;
-(NSURLSessionDataTask *)oDataExecuteForPath:(id<MSODataURL>)path withContent:(NSData *)content andMethod:(MSODataHttpVerb)verb andCallback:(void (^)(id<MSODataResponse>, NSError *))callback;

@required
@property NSString* UrlComponent;
@property id<MSODataReadable> Parent;

-(NSDictionary*)getCustomParameters;	
-(void)addCustomParameters : (NSString*)name withValue : (NSString*)value;

@end

@interface MSODataReadable : NSObject<MSODataReadable>

@property NSString* UrlComponent;
@property id<MSODataReadable> Parent;
@property NSMutableDictionary* CustomParameters;

@end