/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ODataCollectionFetcher.h"
#import "Message.h"
@interface ODataCollectionFetcher()

@property NSString* filter;
@property NSString* select;
@property int top;
@property int skip;
@property NSString* expand;
@property ODataExecutable* parent;
@property NSString* selectedId;
@property NSString* urlComponent;
@property Class clazz;
@property id operations;
@end

@implementation ODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent :(Class)clazz :(Class)operationClazz{

    self.urlComponent = urlComponent;
    self.parent = parent;
    self.clazz = clazz;
    [self reset];
   // self.operations = [[operationClazz alloc] initWith:@"" : self];

    return self;
}

-(ODataCollectionFetcher*)select : (NSString*) params{
    self.select = params;
    return self;
}

-(ODataCollectionFetcher*)filter : (NSString*) params{
    self.select = params;
    return self;
}

-(ODataCollectionFetcher*)top : (int) value{
    
    self.top = value;
    return self;
}

-(ODataCollectionFetcher*)expand : (NSString*) value{
    
    self.expand = value;
    return self;
}

-(NSURLSessionDataTask*)oDataExecute : (NSString*) path : (NSData*) content : (HttpVerb) verb :(void (^)(Response *, NSError *))callback{
    
    if (self.selectedId == nil) {
        NSMutableString* query = [[NSMutableString alloc] initWithString:@"?"];

        if(self.top > -1){
            [query appendFormat:@"$top=%d", self.top];
        }
        
        if(self.skip > -1){
            [query appendFormat:@"$skip=%d", self.skip];
        }
        
        if(self.select != nil){
            [query appendFormat:@"$select=%@", self.select];
        }
        if(self.expand != nil){
            [query appendFormat:@"$expand=%@", self.expand];
        }
        if(self.filter > 0){
            [query appendFormat:@"$filter=%@", self.filter];
        }
        
        if([query  isEqual: @"?"]){
            query = nil;
        }
        NSString* url = query == nil ? self.urlComponent : [[NSString alloc] initWithFormat:@"%@%@", self.urlComponent, query] ;
        
        return [self.parent oDataExecute:url:content :verb :callback];
    }
    else {
        NSString* url = [[NSString alloc] initWithFormat:@"%@('%@')/%@", self.urlComponent, self.selectedId,path];
        return [self.parent oDataExecute:url :content :verb :callback];
    }
}

-(DependencyResolver *)getResolver{
    return [self.parent getResolver];
}

-(NSURLSessionDataTask *)execute:(void (^)(id, NSURLResponse *, NSError *))callback{
    
    return [self.parent oDataExecute:self.urlComponent :nil :GET :^(Response *d, NSError *e) {

        id result = [[[self getResolver]getJsonSerializer] deserialize:[d getData] : [Message class] : @"value"];
        callback(result,nil, e);
    }];
}

-(NSURLSessionDataTask *)add : (id) entity :(void (^)(id, NSURLResponse *, NSError *))callback{
    
    NSString* payload = [[[self getResolver] getJsonSerializer] serialize:entity];
    
    return [self oDataExecute:@"" :[payload dataUsingEncoding:NSUTF8StringEncoding] :POST :callback];
}

-(id)getById : (NSString*)Id{
    
    ODataEntityFetcher* fetcher = nil;
    
    return fetcher;
}

-(void)reset{
    self.top = -1;
    self.skip = -1;
    self.selectedId = nil;
    self.select = nil;
    self.expand = nil;
    self.filter = nil;
}

@end
