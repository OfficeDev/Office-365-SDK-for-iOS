//
//  Request.h
//  office365-odata-interfaces
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "HttpVerb.h"
@interface Request : NSObject

-(void) setContent : (NSData*) content;
-(NSData*) getContent;
-(NSArray*)getHeaders;
-(void)setHeaders :(NSArray*) headers;
-(void)addHeader : (NSString*) name : (NSString*) value;
-(void)removeHeader : (NSString*) name;
-(HttpVerb) getVerb;
-(void)setVerb : (HttpVerb*) httpVerb;
-(void)setUrl : (NSString*) url;
-(NSString*) getUrl;

@end