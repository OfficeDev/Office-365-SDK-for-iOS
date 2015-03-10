/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataRequestImpl.h"
#import "MSODataURLImpl.h"

@interface MSODataRequestImpl()

@property NSMutableURLRequest* request;
@property MSODataHttpVerb httpVerb;
@property id<MSODataURL> odataUrl;
@property NSInputStream* stream;
@property NSInteger size;
@property NSMutableArray* options;

@end

@implementation MSODataRequestImpl

-(id)init;{
    
    self = [super init];
    self.request = [[NSMutableURLRequest alloc]init];
    self.odataUrl = [[MSODataURLImpl alloc] init];
    self.options = [NSMutableArray array];
    
    return self;
}

-(void) setContent : (NSData*) content{
    
    self.request.HTTPBody = content;
}

-(NSData*) getContent{
    
    return self.request.HTTPBody;
}

-(NSDictionary *) getHeaders{
    
    return [self.request allHTTPHeaderFields];
}

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

-(MSODataHttpVerb) getVerb{
    
    return self.httpVerb;
}

-(void)setVerb : (MSODataHttpVerb) httpVerb{
    
    self.httpVerb = httpVerb;
    self.request.HTTPMethod = [self verbToString :httpVerb];
}

-(void)setUrl : (id<MSODataURL>) url{
    
    self.odataUrl = url;
}

-(NSMutableURLRequest*)getMutableRequest{
    
    return self.request;
}

-(void)setMutableRequest : (NSMutableURLRequest*)request{
    
    self.request = request;
}

-(id<MSODataURL>)getUrl{
    
    return self.odataUrl;
}

-(NSString*)verbToString : (MSODataHttpVerb) verb{

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
            break;
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

-(void)setStreamedContent:(NSInputStream *)stream :(NSInteger)size{
    
    self.stream = stream;
    self.size = size;
}

-(NSInputStream *)getStreamedContent{
    return self.stream;
}

-(void)addOption:(NSString *)name :(NSString *)value{
    NSDictionary* dicc = [[NSMutableDictionary alloc] initWithObjectsAndKeys: value,name,nil];
    [self.options addObject:dicc];
}

-(NSMutableArray*)getOptions{
    return self.options;
}

@end