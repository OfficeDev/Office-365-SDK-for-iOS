/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "Property.h"

@implementation Property

-(id)initWith : (objc_property_t)property{
    
    NSString *typeString = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
    NSArray *attributes = [typeString componentsSeparatedByString:@","];
    
    self.Type = [attributes objectAtIndex:0];
    self.Name = [NSString  stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
    
    if ([self isComplexType]) {
        self.SubStringType = [self.Type substringWithRange:NSMakeRange(3, [self.Type length] -4)];
    }
    return self;
}

-(bool)isString{
    return [self.SubStringType isEqualToString:@"NSString"];
}

-(bool)isNumber{
    return [self.SubStringType isEqualToString:@"NSInteger"];
}

-(bool)isDate{
    return [self.SubStringType isEqualToString:@"NSDate"];
}

-(bool)isNSData{
    return [self.SubStringType isEqualToString:@"NSData"];
}

-(bool)isBoolean{
    return [self.Type isEqualToString:@"TB"];
}

-(bool)isCollection{
    return [self.SubStringType hasPrefix:@"NSMutableArray"] ||
    [self.SubStringType hasPrefix:@"NSArray"] ||
    [self.SubStringType hasPrefix:@"NSDictionary"];
}

-(NSString*)getCollectionEntity{
    
    if ([self.SubStringType hasSuffix:@">"]) {
        NSArray *attributes = [self.SubStringType componentsSeparatedByString:@"<"];
        NSString* att = [attributes objectAtIndex:attributes.count -1];
        return [att substringWithRange:NSMakeRange(0, [att length] -1)];
    }
    else{
        return nil;
    }
}

-(bool)isComplexType{
    return [self.Type hasPrefix:@"T@"];
}

@end