//
//  JsonSerializer.h
//  office365-odata-interfaces
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Request.h"
#import "Response.h"

@interface JsonSerializer : NSObject

-(NSString*) serialize : (id) objectToSerialize;
-(id) deserialize : (NSString*) serializedObject : (Class) clazz;
-(id) deserializeList : (NSString*) serializedList : (Class) clazz;

@end