//
//  RequestImpl.m
//  office365_odata_impl
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
#import "RequestImpl.h"

@interface RequestImpl()

//@property HttpVerb* mVerb = HttpVerb.GET;

@property NSData* content;
@property NSMutableArray* headers;
@property NSString* url;
@property HttpVerb verb;

@end

@implementation RequestImpl 

-(id)init{
    self.content = nil;
    self.headers = [NSMutableArray array];
    self.url = [[NSString alloc] init];
    self.verb =
}
/**
 * Sets the request content
 */
public void setContent(byte[] content) {
    mContent = content;
}

/**
 * Returns the request content
 */
public byte[] getContent() {
    return mContent;
}

/**
 * Returns the request headers
 */
public Map<String, String> getHeaders() {
    HashMap<String, String> copy = new HashMap<String, String>();
    copy.putAll(mHeaders);
    
    return copy;
}

/**
 * Sets the request headers
 */
public void setHeaders(Map<String, String> headers) {
    mHeaders = new HashMap<String, String>();
    
    if (headers != null) {
        mHeaders.putAll(headers);
    }
}

/**
 * Adds a header to the request
 * @param name The header name
 * @param value The header value
 */
public void addHeader(String name, String value) {
    mHeaders.put(name, value);
}

/**
 * Removes a header
 * @param name The header name
 */
public void removeHeader(String name) {
    mHeaders.remove(name);
}

/**
 * Sets the request HTTP verb
 */
public void setVerb(HttpVerb httpVerb) {
    mVerb = httpVerb;
}

/**
 * Returns the request HTTP verb
 */
public HttpVerb getVerb() {
    return mVerb;
}

/**
 * Sets the request URL
 */
public void setUrl(String url) {
    mUrl = url;
}

/**
 * Returns the request URL
 */
public String getUrl() {
    return mUrl;
}


-(void) setContent : (NSData*) content;
-(NSData*) getContent;
-(NSArray*)getHeaders;
-(void)setHeaders :(NSArray*) headers;
-(void)addHeader : (NSString*) name : (NSString*) value;
-(void)removeHeader : (NSString*) name;
-(HttpVerb*) getVerb;
-(void)setVerb : (HttpVerb*) httpVerb;
-(void)setUrl : (NSString*) url;
-(NSString*) getUrl;

@end
