//
//  MSODataExecutable.h
//  office365_odata_base
//
//  Created by Gustavo on 11/27/14.
//  Copyright (c) 2014 Microsoft Open Technologies, Inc. All rights reserved.
//

#import "MSODataDependencyResolver.h"
#import "MSODataReadable.h"

@protocol MSODataExecutable<MSODataReadable>

@optional

-(id<MSODataDependencyResolver>) getResolver;
-(NSURLSessionDataTask *)oDataExecuteWithRequest:(id<MSODataRequest>) request callback:  (void (^)(id<MSODataResponse>, NSError *))callback;

@required

@property NSString* UrlComponent;
@property id<MSODataExecutable> Parent;

-(NSDictionary*)getCustomParameters;
-(void)addCustomParameters : (NSString*)name withValue : (NSString*)value;

@end

@interface MSODataExecutable : NSObject<MSODataExecutable>

@property NSString* UrlComponent;
@property id<MSODataExecutable> Parent;
@property NSMutableDictionary* CustomParameters;

@end