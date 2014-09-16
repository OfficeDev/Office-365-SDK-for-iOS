//
//	EntityContainer.m
//
//  Created by Gustavo on 8/25/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "EntityContainer.h"
#import "HttpConnection.h"
#import "Message.h"
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

- (NSURLSessionDataTask *)create :(id)message Path : (NSString*)path Callback:(void (^)(Message* message, NSURLResponse *response, NSError *error))callback{
    NSString *url;
    
    if(path == nil){
        url =  [NSString stringWithFormat:@"%@/Messages", self.Url];
    }else{
       url =[NSString stringWithFormat:@"%@/%@/Messages", self.Url, path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:message];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"POST" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        Message* result = [[Message alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

- (NSURLSessionDataTask *)delete :(NSString*)entityId Type : (Class) classType Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
    NSString *name = NSStringFromClass (classType);
    NSString *url =  [NSString stringWithFormat:@"%@/%@('%@')", self.Url , name, entityId];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url];
    
    return [connection execute:@"DELETE" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        callback(data, reponse,error);
    }];
}

- (NSURLSessionDataTaskOdata *)get :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
    NSString *name = NSStringFromClass (classType);
    NSString *url =  [NSString stringWithFormat:@"%@/%@s('%@')", self.Url , name, entityId];
    
    NSURLSessionDataTaskOdata * task = [[NSURLSessionDataTaskOdata alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"GET";
    
    return task;
}

- (NSURLSessionDataTaskOdata *)getMessages : (NSString*)path : (Class)classType {
   
    NSString *url;
    
    if(path != nil)
      url =  [NSString stringWithFormat:@"%@/%@/Messages", self.Url ,path];
    else
        url =  [NSString stringWithFormat:@"%@/Messages", self.Url];

    NSURLSessionDataTaskOdata * task = [[NSURLSessionDataTaskOdata alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"GET";
    
    return task;
}

- (NSURLSessionDataTask *)update : (id) entity : (NSString*)entityId : (Class) classType Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
    NSString *name = NSStringFromClass (classType);
    NSString *url =  [NSString stringWithFormat:@"%@/%@('%@')", self.Url , name, entityId];
    
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:entity];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"PATCH" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        callback(data, reponse,error);
    }];
}

@end