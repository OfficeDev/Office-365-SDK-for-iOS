#import "ODataOperations.h"

@interface ODataOperations()

@property NSString* urlComponent;
@property ODataExecutable* parent;

@end

@implementation ODataOperations

-(id)initWith : (NSString*) urlComponent : (ODataExecutable*) parent{

    self.urlComponent = urlComponent;
    self.parent = parent;
    return self;
}

- (NSURLSessionDataTask *)oDataExecute:(NSString *)path : (NSData *)content : (HttpVerb)verb :(void (^)(Response* ,NSError *error))callback{
    
    NSString* url = [[NSString alloc] initWithFormat:@"%@/%@",self.urlComponent,path];
    
    return [self.parent oDataExecute:url :content :verb :callback];
}

-(DependencyResolver*) getResolver{
    return [self.parent getResolver];
}

@end
