/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSORequestImpl.h"

@interface MSORequestImpl()

@property NSMutableURLRequest* request;
@property MSOHttpVerb httpVerb;

@end

@implementation MSORequestImpl

-(id)init;{
    self.request = [[NSMutableURLRequest alloc]init];
    
    return self;
}

-(void) setContent : (NSData*) content{
    self.request.HTTPBody = content;
}

-(NSData*) getContent{
    return self.request.HTTPBody;
}

-(NSArray*)getHeaders{ return nil;}

-(void)setHeaders :(NSArray*) headers{
    for (NSDictionary* dicc in headers) {
        [self.request addValue:[[dicc allKeys] objectAtIndex:0] forHTTPHeaderField:[[dicc allValues] objectAtIndex:0]];
    }
}

-(void)addHeader : (NSString*) name : (NSString*) value{
    [self.request addValue:value forHTTPHeaderField: name];
}

-(void)removeHeader : (NSString*) name{
}

-(MSOHttpVerb) getVerb{
    return self.httpVerb;
}

-(void)setVerb : (MSOHttpVerb) httpVerb{
    self.httpVerb = httpVerb;
    self.request.HTTPMethod = [self verbToString :httpVerb];
}

-(void)setUrl : (NSString*) url{
    [self.request setURL:[[NSURL alloc] initWithString:url]];
}

-(NSMutableURLRequest*)getMutableRequest{
    return self.request;
}

-(NSString *)getUrl{
    return self.request.URL.absoluteString;
}

-(NSString*)verbToString : (MSOHttpVerb) verb{

    NSString* verbToString;
    
    switch (verb) {
        case GET:
            verbToString = @"GET";
            break;
        case POST:
            verbToString = @"POST";
            break;
        case DELETE:
            verbToString = @"DELETE";
            break;
        case PATCH:
            verbToString = @"PATCH";
        case PUT:
            verbToString = @"PUT";
            break;
        case HEAD:
            verbToString = @"HEAD";
            break;
        case OPTIONS:
            verbToString = @"OPTIONS";
            break;
        default:
            break;
    }
    
    return verbToString;
}

@end