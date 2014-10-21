//
//  ODataURLImpl.m
//  office365_exchange_helpers
//
//  Created by Gustavo on 10/16/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "MSOODataURLImpl.h"
#import "NSString+NSStringExtensions.h"

@interface MSOODataURLImpl()

@property NSMutableDictionary* QueryStringParameters;	
@property NSMutableArray* PathComponents;
@property NSString* BaseUrl;
-(NSString*)addTrailingSlash : (NSString*) s;
-(NSString*)removeTrailingSlash : (NSString*) s;

@end

@implementation MSOODataURLImpl

-(id)init{
    self.QueryStringParameters = [[NSMutableDictionary alloc] init];
    self.PathComponents = [[NSMutableArray alloc] init];
   
    return self;
}

-(void)addQueryStringParameter : (NSString*)name : (NSString*) value{
    NSMutableDictionary* dicc = [[NSMutableDictionary alloc] initWithObjectsAndKeys:value, name, nil];
    [dicc addEntriesFromDictionary:self.QueryStringParameters];
    self.QueryStringParameters = dicc;
}

-(void)appendPathComponent : (NSString*) value{
    NSMutableArray* a = [[NSMutableArray alloc] initWithObjects:value, nil];
    [a addObjectsFromArray:self.PathComponents];
    self.PathComponents = a;
}

-(NSString*)addTrailingSlash : (NSString*) s{
    NSMutableString* theString = [[NSMutableString alloc] initWithString:s];
    
    if (![theString hasSuffix:@"/"]) {
        [theString appendString:@"/"];
    }
    return theString;
}

-(NSString*)removeTrailingSlash : (NSString*) s{
    if ([s hasSuffix:@"/"]) {
        return [s substringWithRange:NSMakeRange(0, s.length-1)];
    }
    else if ([s hasSuffix:@"%2F"]) {
        return [s substringWithRange:NSMakeRange(0, s.length-3)];
    }
    return s;
}

-(NSString*) toString{
    NSMutableString* queryString = [[NSMutableString alloc] initWithFormat:@"%@/",self.BaseUrl];
    
    for (NSString* value in self.PathComponents) {
        
        if([value hasPrefix:@"('"] && [value hasSuffix:@"')"]){
            queryString =[[NSMutableString alloc] initWithString : [self removeTrailingSlash: queryString]];
        }
        
        [queryString appendString:[[self addTrailingSlash : value] urlencode]];
    }
  
    if([self.QueryStringParameters allKeys].count > 0){
        [queryString appendString:@"?"];
    }
    
    for (NSString* key in [self.QueryStringParameters allKeys]) {
        [queryString appendString:[key urlencode]];
        [queryString appendString:@"="];
        [queryString appendString:[[self.QueryStringParameters objectForKey:key] urlencode]];
        [queryString appendString:@"&"];
    }
    
    return queryString;
}

@end