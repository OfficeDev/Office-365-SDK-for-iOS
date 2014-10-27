/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@interface JsonParser : NSObject

-(id)initWithMetadataValues : (NSDictionary*)values;
-(id)parseWithData : (NSData*)data forType : (Class) type selector:(NSArray* )keys;
-(NSString*)toJsonString : (id)object;
-(NSString*)toJsonString:(id)object Property:(NSString*)name;

@end