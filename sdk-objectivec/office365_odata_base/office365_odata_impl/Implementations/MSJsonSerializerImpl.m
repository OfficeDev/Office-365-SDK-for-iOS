//
//  JsonSerializerImpl.m
//  office365_odata_impl
//
//  Created by Gustavo on 10/7/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSJsonSerializer.h"
#import "JsonParser.h"
#import "MSJsonSerializerImpl.h"

@interface MSJsonSerializerImpl()

@property JsonParser* parser;

@end

@implementation MSJsonSerializerImpl

-(void)jsonSerializerImpl{
    NSDictionary* metadataValues = [[NSDictionary alloc] initWithObjectsAndKeys:@"$$__ODataType", @"@odata.type", nil];
     self.parser = [[JsonParser alloc] initWithMetadataValues:metadataValues];
}

-(NSString*) serialize : (id) objectToSerialize{
    
    return [self.parser toJsonString:objectToSerialize];
}

-(NSString*) serialize : (id) objectToSerialize : (NSString*) name{
    
    return [self.parser toJsonString:objectToSerialize Property:name];
}

-(id) deserialize : (NSData*) serializedObject : (Class) clazz {
    return [self.parser parseWithData:serializedObject forType:clazz selector:nil];
}

-(id) deserializeList : (NSData*) serializedList : (Class) clazz{
    NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];
    
    return [self.parser parseWithData:serializedList forType:clazz selector:selectors];
}

@end