//
//  MSOODataMediaEntityFetcher.m
//  office365_drive_sdk
//
//  Created by Gustavo on 10/22/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "MSOODataMediaEntityFetcher.h"

@implementation MSOODataMediaEntityFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : nil];
}

-(NSURLSessionDataTask *)getContent:(void (^)(NSData * content, NSError * error))callback{
    
    id<MSOODataURL> url = [[self getResolver] createODataURL];
    [url appendPathComponent:@"$value"];
    
    return [self oDataExecute:url :nil :GET :^(id<MSOResponse> r, NSError *e) {
        
        if(e == nil){
            callback([r getData],e);
        }
        else{
            callback(nil,e);
        }
    }];
}

-(NSURLSessionDataTask *)putContent:(NSData *)content :(void (^)(int, NSError *))callback{

    id<MSOODataURL> url = [[self getResolver] createODataURL];
    [url appendPathComponent:@"$value"];
    
    return [self oDataExecute:url :content :PUT :^(id<MSOResponse> r, NSError *e) {
        
        if(e == nil){
            callback([r getStatus],e);
        }
        else{
            callback([e code],e);
        }
    }];
}

@end