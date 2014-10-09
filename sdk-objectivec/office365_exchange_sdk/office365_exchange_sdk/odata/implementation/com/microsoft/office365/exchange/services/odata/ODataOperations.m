#import "ODataOperations.h"

@implementation ODataOperations

@synthesize Parent;
@synthesize UrlComponent;

-(id)initOperationWithUrl:(NSString *)urlComponent Parent:(id<ODataExecutable>)parent{
    self.UrlComponent = urlComponent;
    self.Parent = parent;
    return self;
}

- (NSURLSessionDataTask *)oDataExecute:(NSString *)path : (NSData *)content : (MSOHttpVerb)verb :(void (^)(id<MSOResponse> ,NSError *error))callback{
    
    NSString* url = [[NSString alloc] initWithFormat:@"%@/%@",self.UrlComponent,path];
    
    return [self.Parent oDataExecute:url :content :verb :callback];
}

-(id<MSODependencyResolver>) getResolver{
    return [self.Parent getResolver];
}

@end
