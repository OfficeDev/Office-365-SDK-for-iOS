//
//  JsonSerializerImpl.m
//  office365_odata_impl
//
//  Created by Gustavo on 10/7/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <office365_odata_interfaces/MSOJsonSerializer.h>
#import "JsonParser.h"
#import "MSOJsonSerializerImpl.h"

@interface MSOJsonSerializerImpl()

@property JsonParser* parser;

@end

@implementation MSOJsonSerializerImpl

-(void)jsonSerializerImpl{
     self.parser = [JsonParser alloc];
}

-(NSString*) serialize : (id) objectToSerialize{
    
    return [self.parser toJsonString:objectToSerialize];
}

-(id) deserialize : (NSData*) serializedObject : (Class) clazz {
    return [self.parser parseWithData:serializedObject forType:clazz selector:nil];
}

-(id) deserializeList : (NSData*) serializedList : (Class) clazz{
    NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];
    
    return [self.parser parseWithData:serializedList forType:clazz selector:selectors];
}

@end