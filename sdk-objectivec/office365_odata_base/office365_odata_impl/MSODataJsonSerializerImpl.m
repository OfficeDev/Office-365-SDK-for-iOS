/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataJsonSerializerImpl.h"
#import <Foundation/Foundation.h>
#import "JsonParser.h"

@interface MSODataJsonSerializerImpl()

@property JsonParser* parser;

@end

@implementation MSODataJsonSerializerImpl

-(void)jsonSerializerImpl{
    NSDictionary* metadataValues = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    @"$$__ODataType", @"@odata.type",
                                    @"$$__description", @"description",
                                    @"$$__default",@"default", nil];
    
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