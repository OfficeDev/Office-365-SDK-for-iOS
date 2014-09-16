//
//  NSURLSessionDataTaskOdata.m
//  office365-exchange-sdk
//
//  Created by Gustavo on 9/12/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSURLSessionDataTaskOdata.h"
#import "HttpConnection.h"
#import "JsonParser.h"

@interface NSURLSessionDataTaskOdata()

    @property NSString* filter;
    @property NSString* select;
    @property int top;
    @property int skip;
    @property int take;

@end

@implementation NSURLSessionDataTaskOdata

-(NSURLSessionDataTaskOdata*)select : (NSString*) params{
    
    self.select = params;
    return self;
}

-(NSURLSessionDataTaskOdata*)filter : (NSString*) params{
    self.select = params;
    return self;
}

-(NSURLSessionDataTaskOdata*)top : (int) value{
    
    self.top = value;
    return self;
}

-(NSURLSessionDataTaskOdata*)take : (int) value{
    
    self.take = value;
    return self;
}

-(NSString*)createURL{
    
    NSMutableString* result = [[NSMutableString alloc] initWithString:@"?"];
    
    if(self.select != nil){
        [result appendFormat:@"$select=%@", self.select];
    }
    if(self.filter != nil){
        if(![result isEqualToString:@"?"]){ [result appendString:@"&"];}
            
        [result appendFormat:@"$filter=%@", self.filter];
    }
    if(self.skip > 0){
        if(![result isEqualToString:@"?"]){ [result appendString:@"&"];}
        [result appendFormat:@"$skip=%d", self.skip];
    }
    if(self.take > 0){
        if(![result isEqualToString:@"?"]){ [result appendString:@"&"];}
        [result appendFormat:@"$take=%d", self.take];
    }
    if(self.top > 0){
        if(![result isEqualToString:@"?"]){ [result appendString:@"&"];}
        [result appendFormat:@"$top=%d", self.top];
    }
    if([result isEqualToString:@"?"]) result = (NSMutableString*)@"";
    
    return result;
}

-(void)execute : (NSString *)method callback:(void (^)(id data, NSURLResponse *response, NSError *error))functionResult
{
    NSString *url =  [NSString stringWithFormat:@"%@/%@", self.Url ,[self createURL]];
    
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:self.entity];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [[connection execute:method
                       callback:
             ^(NSData  *data, NSURLResponse *reponse, NSError *error) {
                          
                           NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];
                          
                           id result = [parser parseWithData:data forType:self.ClassType selector:selectors];
            
                           functionResult(result, reponse, error);
                           
                       }] resume];
}

-(void)execute : (void (^)(id data, NSURLResponse *response, NSError *error))functionResult
{
    [self execute:self.method callback:^(id data, NSURLResponse *response, NSError *error) {
        functionResult(data,response,error);
    }];
}

@end