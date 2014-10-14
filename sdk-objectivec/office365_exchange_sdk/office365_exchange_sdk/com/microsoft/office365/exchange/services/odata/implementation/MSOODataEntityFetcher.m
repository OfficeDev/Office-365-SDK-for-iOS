/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"

@interface MSOODataEntityFetcher()

@property Class entityClass;
@property MSOODataOperations* operations;

@end

@implementation MSOODataEntityFetcher

@synthesize Parent;
@synthesize UrlComponent;

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent : (Class) entityClass{
    self.UrlComponent = urlComponent;
    self.Parent = parent;
    self.operations = [[MSOODataOperations alloc] initOperationWithUrl:@"" Parent:parent];
    self.entityClass = entityClass;
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
            id entity = [[[self getResolver] getJsonSerializer] deserialize:[r getData] :self.entityClass];
            
            callback(entity, e);
        }
        else callback(nil, e);
    }];
}

@end
