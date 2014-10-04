//
//  BaseODataContainer.h
//  office365-exchange-sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODataExecutable.h"

@interface BaseODataContainer : ODataExecutable

-(id)initWit : (NSString *)url : (DependencyResolver*) resolver;

-(NSURLSessionDataTask*) oDataExecute:(NSString *)path :(NSData *)content :(HttpVerb)verb : (void (^)(NSData *, NSURLResponse *, NSError *))callback;
-(DependencyResolver*) getResolver;

@end