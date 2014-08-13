//
//  BaseEntity.h
//  office365-base-sdk
//
//  Created by Gustavo on 7/21/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Metadata.h"

@interface BaseEntity : NSObject

@property NSString *Id;
@property Metadata *Metadata;
//@property NSDictionary *Data;
- (instancetype) initWithJson:(NSData *)jsonData;
- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

-(void) createMetadata : (NSDictionary*) data;
-(BaseEntity *)createFromJson:(NSDictionary *)data;
-(NSObject*) getData : (NSString*) name;

@end