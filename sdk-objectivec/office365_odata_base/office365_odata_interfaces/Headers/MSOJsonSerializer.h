/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@protocol MSOJsonSerializer

@required
-(NSString*) serialize : (id) objectToSerialize;
-(id) deserialize : (NSData*) serializedObject : (Class) clazz;
-(id) deserializeList : (NSData*) serializedList : (Class) clazz;
-(NSString*) serialize : (id) objectToSerialize : (NSString*) name;
@end