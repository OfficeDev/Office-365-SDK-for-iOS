/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ODataEntityFetcher.h"

@interface ODataEntityFetcher()

@property Class clazz;
@property ODataOperations* operations;

@end

@implementation ODataEntityFetcher

@synthesize Parent;
@synthesize UrlComponent;

-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent{
    return nil;
}

-(id)initWith : (NSString *)urlComponent : (id<ODataExecutable>) parent : (Class) clazz : (Class) operationClazz {
    self.UrlComponent = urlComponent;//[[NSString alloc] initWithFormat:@"%@/%@", parent.UrlComponent , urlComponent];
    self.Parent = parent;
    self.clazz = clazz;
    self.operations = [[ODataOperations alloc] initOperationWithUrl:@"" Parent:parent];//[[operationClazz alloc] initOperationWith:@"" : self];
    
    return self;
}

-(id<MSODependencyResolver>) getResolver{
    return [self.Parent getResolver];
}

-(id)getOperations{
    return self.operations;
}

-(NSURLSessionDataTask*) oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb :(void (^)(id<MSOResponse>, NSError *))callback{
    NSMutableString* url = [[NSMutableString alloc] initWithString:@""];
    
    if([self.UrlComponent length] > 0){
        [url appendString:self.UrlComponent];
    }
    
    if([path length]>0){
        [url appendString:@"/"];
        [url appendString:path];
    }
    
    return [self.Parent oDataExecute:url :content :verb :^(id<MSOResponse> r, NSError *e) {
        callback(r,e);
    }];
}

-(NSURLSessionDataTask*) update:(id)updatedEntity : (void (^)(id, NSError *))callback{
    NSString *payload = [[[self getResolver] getJsonSerializer]serialize:updatedEntity];
    
    return [self oDataExecute:@"" :[payload dataUsingEncoding:NSUTF8StringEncoding] : PATCH : ^(id<MSOResponse> r, NSError *e) {
        callback(updatedEntity, e);
    }];
}

-(NSURLSessionDataTask*) delete : (void (^)(id,NSError *))callback{
    return [self oDataExecute:@"" :nil :DELETE :^(id<MSOResponse> r, NSError *e) {
        callback(r, e);
    }];
}

-(NSURLSessionDataTask*) execute:(void (^)(id , NSError *))callback{
    //return [self oDataExecute:@"" :nil :GET :^(id<MSOResponse> r, NSError *e) {
    return [self oDataExecute:self.UrlComponent :nil :GET :^(id<MSOResponse> r, NSError *e) {
        if (e == nil) {
            id entity = [[[self getResolver] getJsonSerializer] deserialize:[r getData] :self.clazz];
            
            callback(entity, e);
        }
        else callback(nil, e);
    }];
}

@end
