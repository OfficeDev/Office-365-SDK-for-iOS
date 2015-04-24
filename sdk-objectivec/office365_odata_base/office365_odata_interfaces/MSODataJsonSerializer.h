/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@protocol MSODataJsonSerializer

@required

- (NSString *)serialize:(id)objectToSerialize;
- (id)deserialize:(NSData *)serializedObject asClass:(Class)theClass;
- (id)deserializeList:(NSData *)serializedList asClass:(Class)theClass;
- (NSString *)serialize:(id)objectToSerialize property:(NSString *)name;

@end