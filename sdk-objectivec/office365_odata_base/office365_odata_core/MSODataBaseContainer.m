/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataBaseContainer.h"
#import "MSODataBaseContainerHelper.h"
#import "MSODataCredentials.h"
#import "MSODataHttpTransport.h"
#import "MSODataRequest.h"
#import "MSODataURL.h"

@implementation MSODataBaseContainer

@synthesize parent = _parent;
@synthesize urlComponent = _urlComponent;
@synthesize resolver = _resolver;

- (instancetype)initWithUrl:(NSString *)url dependencyResolver:(id<MSODataDependencyResolver>)resolver {
    
    if (self = [super init]) {

        _urlComponent = url;
        _resolver = resolver;
    }
    
    return self;
}

- (NSURLSessionTask *)oDataExecuteRequest:(id<MSODataRequest>)request
                                 callback:(void (^)(id<MSODataResponse> response, MSODataException *exception))callback {
    
    request.url.baseUrl = self.urlComponent;
    
    id<MSODataHttpTransport> httpTransport = self.resolver.httpTransport;

    if([request.headers objectForKey:@"Content-Type"] == nil) {
        
        [request addHeaderWithName:@"Content-Type" value:@"application/json"];
    }
    
    [request addHeaderWithName:@"User-Agent"
                         value:[self.resolver getPlatformUserAgent:NSStringFromClass([self class])]];
     
    NSString *productName = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey];
    
    [request addHeaderWithName:@"X-ClientService-ClientTag" value:[self.resolver getPlatformUserAgent:productName]];
    [request addHeaderWithName:@"OData-Version" value:@"4.0"];
    [request addHeaderWithName:@"OData-MaxVersion" value:@"4.0"];
    
    // resolver.credentials results in call to authenticationContext.acquireTokenSilent
    // which may fail if all tokens are expired, or if they were never set properly
    // TODO: Plan for handling errors.
    [self.resolver.credentials prepareRequest:request];
    
    return [httpTransport executeRequest:request callback:^(id<MSODataResponse> r, MSODataException *e) {
        
        callback(r,e);
    }];
}

@end