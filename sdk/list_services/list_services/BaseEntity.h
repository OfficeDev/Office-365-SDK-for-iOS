/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Metadata.h"

@interface BaseEntity : NSObject

@property NSString *Id;
@property Metadata *Metadata;

- (id) initWithJson:(NSData *)jsonData;
- (id) initWithDictionary:(NSDictionary *)dictionary;

-(void) createMetadata : (NSDictionary*) data;
-(BaseEntity *)createFromJson:(NSDictionary *)data;
-(NSObject*) getData : (NSString*) name;
-(NSDictionary*) getRawResults;

@end