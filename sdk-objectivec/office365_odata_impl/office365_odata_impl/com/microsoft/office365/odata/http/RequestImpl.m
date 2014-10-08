//
//  RequestImpl.m
//  office365_odata_impl
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
#import "RequestImpl.h"

@interface RequestImpl()

@property NSMutableURLRequest* request;

@end

@implementation RequestImpl 

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

    //NSString* url = r.URL.absoluteString;
    
    //NSMutableURLRequest* request1 = [[NSMutableURLRequest alloc] initWithURL: [[NSURL alloc] initWithString:url]];
    //[request1 addValue: @"100" forHTTPHeaderField: @"Content-Length"];
    //[request1 addValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" forHTTPHeaderField: @"Accept"];
    //[request1 addValue:@"100-continue" forHTTPHeaderField: @"Expect"];

    [self.request addValue:value forHTTPHeaderField: name];
    //[request1 addValue:@"IOS-SDK" forHTTPHeaderField: @"X-ClientService-ClientTag"];
    //[request1 addValue:@"*" forHTTPHeaderField: @"IF-MATCH"];
   // [self.request addValue:@"Basic di1ndWhhbnNAbXNvcGVudGVjaC5jY3NjdHAubmV0OkFEQ0dhaDE0ODc=" forHTTPHeaderField:@"Authorization"];
    
   // return [self.request addValue:value forHTTPHeaderField:name];
}

-(void)removeHeader : (NSString*) name{
}

-(HttpVerb) getVerb{
    return nil;
}

-(void)setVerb : (HttpVerb) httpVerb{
    NSString* s;
    switch (httpVerb) {
        case 0:
            s = @"GET";
            break;
        case 1:
            s = @"POST";
            break;
        case 2:
            s = @"DELETE";
        break;
            case 6:
            s = @"PATCH";
        break;
        default:
            break;
    }
    self.request.HTTPMethod = s;
}

-(void)setUrl : (NSString*) url{
    [self.request setURL:[[NSURL alloc] initWithString:url]];
}

-(NSMutableURLRequest*)getMutableRequest{
    return self.request;
}

@end



