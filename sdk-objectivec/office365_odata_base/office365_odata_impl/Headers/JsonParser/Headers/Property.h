/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Property : NSObject
@property NSString *Type;
@property NSString *SubStringType;
@property NSString *Name;

-(id)initWith : (objc_property_t)property;
-(bool)isString;
-(bool)isDate;
-(bool)isNSData;
-(bool)isCollection;
-(bool)isComplexType;
-(NSString*)getCollectionEntity;
-(bool)isNumber;
-(bool)isBoolean;
@end