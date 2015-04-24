/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataJsonSerializerImpl.h"
#import "MSOJsonParser.h"

@interface MSODataJsonSerializerImpl()

@property (copy, nonatomic, readonly) MSOJsonParser *parser;

@end

@implementation MSODataJsonSerializerImpl

- (instancetype)init {
    
    if (self = [super init]) {
        
        NSDictionary *metadataValues = [[NSDictionary alloc] initWithObjectsAndKeys:
                                        @"odataType", @"@odata.type",
                                        @"$$__self", @"self",
                                        @"$$__description", @"description",
                                        @"$$__default",@"default", nil];
        
        _parser = [[MSOJsonParser alloc] initWithMetadataValues:metadataValues];
    }

    return self;
}

- (NSString *)serialize:(id)objectToSerialize {
    
    return [self.parser toJsonString:objectToSerialize];
}

- (NSString *)serialize:(id)objectToSerialize property:(NSString *)name {
    
    return [self.parser toJsonString:objectToSerialize Property:name];
}

- (id)deserialize:(NSData *)serializedObject asClass:(Class)theClass {
    
    return [self.parser parseWithData:serializedObject forType:theClass selector:nil];
}

- (id)deserializeList:(NSData *)serializedList asClass:(Class)theClass {
    
    NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];
    
    return [self.parser parseWithData:serializedList forType:theClass selector:selectors];
}

@end