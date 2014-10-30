/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSOutlookODataMediaEntityFetcher.h"

@implementation MSOutlookODataMediaEntityFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : nil];
}

-(NSURLSessionDataTask *)getContent:(void (^)(NSData * content, NSError * error))callback{
    
    id<MSODataURL> url = [[self getResolver] createODataURL];
    [url appendPathComponent:@"$value"];
    
    return [self oDataExecute:url :nil :GET :^(id<MSResponse> r, NSError *e) {
        
        if(e == nil){
            callback([r getData],e);
        }
        else{
            callback(nil,e);
        }
    }];
}

-(NSURLSessionDataTask *)putContent:(NSData *)content :(void (^)(NSInteger, NSError *))callback{

    id<MSODataURL> url = [[self getResolver] createODataURL];
    [url appendPathComponent:@"$value"];
    
    return [self oDataExecute:url :content :PUT :^(id<MSResponse> r, NSError *e) {
        
        if(e == nil){
            callback([r getStatus],e);
        }
        else{
            callback([e code],e);
        }
    }];
}

@end
