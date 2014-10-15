/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataCollectionFetcher.h"

@interface MSOODataCollectionFetcher()

@property NSString* filter;
@property NSString* select;
@property int top;
@property int skip;
@property NSString* expand;
@property NSString* selectedId;
@property Class entityClass;
@property id operations;

@end

/**
* The implementation file for type MSOODataCollectionFetcher.
*/

@implementation MSOODataCollectionFetcher

@synthesize Parent;
@synthesize UrlComponent;

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent :(Class)entityClass{

    self.urlComponent = urlComponent;
    self.parent = parent;
    self.entityClass = entityClass;
    [self reset];
   // self.operations = [[operationClass alloc] initWith:@"" : self];

    return self;
}

-(MSOODataCollectionFetcher*)select : (NSString*) params{
    self.select = params;
    return self;
}

-(MSOODataCollectionFetcher*)filter : (NSString*) params{
    self.select = params;
    return self;
}

-(MSOODataCollectionFetcher*)top : (int) value{
    
    self.top = value;
    return self;
}

-(MSOODataCollectionFetcher*)expand : (NSString*) value{
    
    self.expand = value;
    return self;
}

-(NSURLSessionDataTask*)oDataExecute : (NSString*) path : (NSData*) content : (MSOHttpVerb) verb :(void (^)(id<MSOResponse>, NSError *))callback{
    
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
        NSString* url = query == nil ? self.UrlComponent : [[NSString alloc] initWithFormat:@"%@%@", self.UrlComponent, query] ;
        
        return [self.Parent oDataExecute:url:content :verb :callback];
    }
    else {
        NSString* url = [[NSString alloc] initWithFormat:@"%@('%@')/%@", self.UrlComponent, self.selectedId,path];
        return [self.Parent oDataExecute:url :content :verb :callback];
    }
}

-(id<MSODependencyResolver>)getResolver{
    return [self.Parent getResolver];
}

-(NSURLSessionDataTask *)execute:(void (^)(id, NSError *))callback{
    
    return [self.Parent oDataExecute:self.UrlComponent :nil :GET :^(id<MSOResponse> d, NSError *e) {

        id result = [[[self getResolver]getJsonSerializer] deserializeList:[d getData] : self.entityClass];
        callback(result, e);
    }];
}

-(NSURLSessionDataTask *)add : (id) entity :(void (^)(id, NSError *))callback{
    
    NSString* payload = [[[self getResolver] getJsonSerializer] serialize:entity];
    
    return [self oDataExecute:@"" :[payload dataUsingEncoding:NSUTF8StringEncoding] :POST :^(id<MSOResponse> d, NSError *e) {
        id result = [[[self getResolver]getJsonSerializer] deserialize:[d getData] : self.entityClass];
        callback(result, e);
    }];
}

-(MSOODataEntityFetcher*)getById : (NSString*)Id{
    
    self.selectedId = Id;
    
    MSOODataEntityFetcher* fetcher = [[MSOODataEntityFetcher alloc] initWith:@"" :self :self.entityClass];
    
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
