/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

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

-(NSURLSessionDataTask*)oDataExecute : (id<MSOODataURL>) path : (NSData*) content : (MSOHttpVerb) verb :(void (^)(id<MSOResponse>, NSError *))callback{
    
    [path appendPathComponent:self.UrlComponent];
    if (self.selectedId == nil) {
        [MSOEntityFetcherHelper setPathForCollections:path :self.UrlComponent :self.top :self.skip :self.select :self.expand :self.filter];
    }
    else {
        [MSOEntityFetcherHelper setPathForCollections:path :self.UrlComponent :self.top :self.skip :self.select :self.expand :self.filter];
        [MSOBaseODataContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];
    }
    
    return [self.Parent oDataExecute:path:content :verb :callback];
}

-(NSDictionary*)getCustomParameters{
    return self.CustomParameters;
}

-(void)addCustomParameters : (NSString*)name : (NSString*)value{
    NSDictionary* dicc = [[NSDictionary alloc] initWithObjectsAndKeys:value, name, nil];
    [self.CustomParameters addEntriesFromDictionary:dicc];
}

-(id<MSODependencyResolver>)getResolver{
    return [self.Parent getResolver];
}

-(NSURLSessionDataTask *)execute:(void (^)(id, NSError *))callback{
    
    return [self oDataExecute:[[self getResolver] createODataURL] :nil :GET :^(id<MSOResponse> d, NSError *e) {

        id result = [[[self getResolver]getJsonSerializer] deserializeList:[d getData] : self.entityClass];
        callback(result, e);
    }];
}

-(NSURLSessionDataTask *)add : (id) entity :(void (^)(id, NSError *))callback{
    
    NSString* payload = [[[self getResolver] getJsonSerializer] serialize:entity];
    
    return [self oDataExecute:[[self getResolver] createODataURL] :[payload dataUsingEncoding:NSUTF8StringEncoding] :POST :^(id<MSOResponse> d, NSError *e) {
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
