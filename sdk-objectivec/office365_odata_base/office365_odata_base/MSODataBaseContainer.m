/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataBaseContainer.h"
#import "MSODataBaseContainerHelper.h"

@interface MSODataBaseContainer()

@property id<MSODataDependencyResolver> resolver;

@end

/**
* The implementation file for type MSBaseODataContainer.
*/

@implementation MSODataBaseContainer

@synthesize Parent;
@synthesize UrlComponent;

-(id)initWithUrl : (NSString *)url  dependencyResolver : (id<MSODataDependencyResolver>) resolver{
    
    self.UrlComponent = url;
    self.resolver = resolver;
    
    return self;
}

-(NSURLSessionDataTask *)oDataExecuteWithRequest:(id<MSODataRequest>) request callback:  (void (^)(id<MSODataResponse>, MSODataException *))callback{
    
    [[request getUrl] setBaseUrl:self.UrlComponent];
    id<MSODataHttpTransport> httpTransport = [self.resolver getHttpTransport];

    [request addHeader:@"Content-Type" :@"application/json"];
    [request addHeader:@"User-Agent" :[self.resolver getPlatformUserAgent:NSStringFromClass([self class])]];
     
    NSString* productName = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];
    [request addHeader:@"X-ClientService-ClientTag" :[self.resolver getPlatformUserAgent:productName]];
    [request addHeader:@"OData-Version" :@"4.0"];
    [request addHeader:@"OData-MaxVersion" :@"4.0"];
    
    [[self.resolver getCredentials] prepareRequest:request];
    
    return [httpTransport execute:request :^(id<MSODataResponse> r, MSODataException *e) {
        callback(r,e);
    }];
}

-(id<MSODataDependencyResolver>) getResolver{
    return self.resolver;
}

@end