//
//  ODataEntityFetcher.m
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "ODataEntityFetcher.h"

@interface ODataEntityFetcher()

@property NSString* urlComponent;
@property ODataExecutable* parent;
@property Class clazz;
@property ODataOperations* operations;

@end

@implementation ODataEntityFetcher

-(id)initWith : (NSString *)urlComponent : (ODataExecutable*) parent : (Class) clazz : (Class) operationClazz {
    self.urlComponent = urlComponent;
    self.parent = parent;
    self.clazz = clazz;
    self.operations = [[operationClazz alloc] initWith:@"" : self];
    
    return self;
}

-(DependencyResolver*) getResolver{
    return [self.parent getResolver];
}

-(ODataOperations *)getOperations{
    return self.operations;
}

-(NSURLSessionDataTask*) oDataExecute:(NSString *)path :(NSData *)content :(HttpVerb)verb callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback{
    NSMutableString* url = [NSMutableString alloc];
    
    if([self.urlComponent length] > 0){
        [url appendString:@"/"];
    }
    
    if([path length]>0){
        [url appendString:@"/"];
        [url appendString:path];
    }
    
    return [self.parent oDataExecute:url :content :verb callback:callback];
}

-(NSURLSessionDataTask*) update:(id)updatedEntity callback:(void (^)(id, NSURLResponse *, NSError *))callback{
    NSString *payload = [[[self getResolver] getJsonSerializer]serialize:updatedEntity];
    
    return [self oDataExecute:@"" :[payload dataUsingEncoding:NSUTF8StringEncoding] : PATCH callback:callback];
}

-(NSURLSessionDataTask*) delete : (void (^)(id, NSURLResponse *, NSError *))callback{
    return [self oDataExecute:@"" :nil :DELETE callback:callback];
}

-(NSURLSessionDataTask*) execute:(void (^)(id , NSURLResponse *, NSError *))callback{

    return [self oDataExecute:@"" : nil :GET callback:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil) {
            NSString* entityString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            id entity = [[[self getResolver] getJsonSerializer] deserialize:entityString :self.clazz];
            
            callback(entity, response, error);
        }
        else callback(nil, response, error);
    }];
}

@end