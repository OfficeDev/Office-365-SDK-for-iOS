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

-(NSURLSessionDataTask *)oDataExecuteWithRequest:(id<MSODataRequest>) request callback:  (void (^)(id<MSODataResponse>, NSError *))callback{
    
    [[request getUrl] setBaseUrl:self.UrlComponent];
    id<MSODataHttpTransport> httpTransport = [self.resolver getHttpTransport];
    
    //[request setVerb:[request getVerb]];
    //[request setUrl: [[request getUrl]toString]];
    //[request setContent:[request getContent]];
    
    [request addHeader:@"Content-Type" :@"application/json"];
    
    //[request addHeader:@"User-Agent" :[self.Resolver getPlatformUserAgent:[self class]];
    //[request addHeader:@"X-ClientService-ClientTag" :[self.Resolver getPlatformUserAgent:productName]];
    
    //if(verb == PATCH || verb == DELETE){
    //    [request addHeader:@"If-Match" :@"*"];
    //}
    
    [[[self.resolver getCredentialsFactory]getCredentials]prepareRequest:request];
    
    NSLog(@"VERB: %ld, URL: %@, HEADERS/Keys: %@, HEADERS/Values: %@", [request getVerb], [request getUrl], [[request getHeaders] allKeys], [[request getHeaders] allValues]);
    return [httpTransport execute:request :^(id<MSODataResponse> r, NSError *e) {
        callback(r,e);
    }];
}

-(id<MSODataDependencyResolver>) getResolver{
    return self.resolver;
}

@end