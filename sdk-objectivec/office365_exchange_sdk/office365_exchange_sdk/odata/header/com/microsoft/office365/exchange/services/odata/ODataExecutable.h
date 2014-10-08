/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import <office365_odata_interfaces/DependencyResolver.h>
#import <Foundation/Foundation.h>

@interface ODataExecutable : NSObject

//- (NSURLSessionDataTask *)oDataExecute:(NSString *)path : (NSData *)content : (HttpVerb)verb :(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataTask*) oDataExecute:(NSString *)path :(NSData *)content :(HttpVerb)verb : (void (^)(Response *, NSError *))callback;

-(DependencyResolver*) getResolver;

@end
