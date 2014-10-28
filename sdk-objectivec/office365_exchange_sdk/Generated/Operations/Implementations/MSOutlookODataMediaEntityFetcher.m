/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataMediaEntityFetcher.h"

@implementation MSOutlookODataMediaEntityFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
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
