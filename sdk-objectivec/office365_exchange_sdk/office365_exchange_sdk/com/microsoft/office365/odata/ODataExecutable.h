//
//  ODataExecutable.h
//  office365-exchange-sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
#import <office365_odata_interfaces/DependencyResolver.h>
#import <Foundation/Foundation.h>

@protocol ODataExecutable

- (NSURLSessionDataTask *)oDataExecute:(NSString *)path : (NSData *)content : (HttpVerb)verb callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(DependencyResolver*) getResolver;
@end

@interface ODataExecutable : NSObject<ODataExecutable>

@end