/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <office365_odata_interfaces/MSODependencyResolver.h>
#import <Foundation/Foundation.h>

@protocol ODataExecutable

@required
@property NSString* UrlComponent;
@property id<ODataExecutable> Parent;

-(id<MSODependencyResolver>) getResolver;

-(NSURLSessionDataTask*) oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb
                                     : (void (^)(id<MSOResponse>, NSError *))callback;

@end