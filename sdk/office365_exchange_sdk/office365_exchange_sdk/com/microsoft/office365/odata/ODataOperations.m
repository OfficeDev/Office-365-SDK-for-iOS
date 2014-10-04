//
//  ODataOperations.m
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
#import "ODataOperations.h"

@interface ODataOperations()

@property NSString* urlComponent;
@property ODataOperations* parent;

@end

@implementation ODataOperations

-(id)initWith : (NSString*) urlComponent : (ODataExecutable*) parent{

    self.urlComponent = urlComponent;
    self.parent = parent;
    return self;
}

- (NSURLSessionDataTask *)oDataExecute:(NSString *)path : (NSData *)content : (HttpVerb*)verb callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
    NSString* url = [[NSString alloc] initWithFormat:@"%@/%@",self.urlComponent,path];
    
    return [self.parent oDataExecute:url :content :verb callback:callback];
}

-(DependencyResolver*) getResolver{
    return [self.parent getResolver];
}

@end