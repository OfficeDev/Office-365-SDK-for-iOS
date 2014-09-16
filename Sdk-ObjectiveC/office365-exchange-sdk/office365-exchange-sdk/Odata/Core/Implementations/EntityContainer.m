//
//	EntityContainer.m
//
//  Created by Gustavo on 8/25/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "EntityContainer.h"
#import "HttpConnection.h"

@implementation EntityContainer

@synthesize Credential;
@synthesize Url;

static EntityContainer *entityContainer;

+(id)initializeEntityContainer:(NSString *)url credentials:(Credentials *)credentials{
     entityContainer = nil;
    
    @synchronized(self) {
        if (entityContainer == nil)
            entityContainer = [[self alloc] initWithUrl:url credentials:credentials];
    }
    
    return entityContainer;
}

+(id)getEntityContainer{
    @synchronized(self) {
    }
    
    return entityContainer;
}

- (NSURLSessionDataTask *)executeForPath :(NSString*)path Method:(NSString*)method Body:(NSData *)body Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
    NSString *url =  [NSString stringWithFormat:@"%@%@", self.Url ,path];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:method callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        callback(data, reponse,error);
    }];
}

@end