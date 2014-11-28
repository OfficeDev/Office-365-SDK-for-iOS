/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataMediaEntityFetcher.h"

@implementation MSODataMediaEntityFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass:nil];
}

-(NSURLSessionDataTask *)getContentWithCallback:(void (^)(NSData * content, MSODataException * error))callback{
    
    id<MSODataRequest> request = [[self getResolver] createODataRequest];
    [[request getUrl] appendPathComponent:@"$value"];
    [request setVerb:GET];
    
    return [self oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *e) {
        if(e == nil){
            callback([r getPayload],e);
        }
        else{
            callback(nil,e);
        }
    }];
}

-(NSURLSessionDataTask *)putContent:(NSData *)content withCallback:(void (^)(NSInteger, MSODataException *))callback{
    
    id<MSODataRequest> request = [[self getResolver] createODataRequest];
    [[request getUrl] appendPathComponent:@"$value"];
    [request setVerb:PUT];
    [request setContent:content];
    
    return [self oDataExecuteWithRequest:request callback:^(id<MSODataResponse>r, MSODataException *e) {
        if(e == nil){
            callback([r getStatus],e);
        }
        else{
            callback([e code],e);
        }
    }];
}

@end