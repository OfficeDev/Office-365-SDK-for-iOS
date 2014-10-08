//
//  JsonSerializerImpl.m
//  office365_odata_impl
//
//  Created by Gustavo on 10/7/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <office365_odata_interfaces/JsonSerializer.h>
#import "JsonParser.h"
#import "JsonSerializerImpl.h"

@interface JsonSerializerImpl()

@property JsonParser* parser;

@end

@implementation JsonSerializerImpl

-(void)jsonSerializerImpl{
     self.parser = [JsonParser alloc];
}
-(NSString*) serialize : (id) objectToSerialize{
    
    return nil;
}

-(id) deserialize : (NSData*) serializedObject : (Class) clazz : (NSString*)selector{
    NSArray* selectors = [[NSArray alloc] initWithObjects:selector, nil];
    
    return [self.parser parseWithData:serializedObject forType:clazz selector:selectors];
}

-(id) deserializeList : (NSData*) serializedList : (Class) clazz : (NSString*)selector{
    NSArray* selectors = [[NSArray alloc] initWithObjects:selector, nil];
    
    return [self.parser parseWithData:serializedList forType:clazz selector:selectors];
}

@end