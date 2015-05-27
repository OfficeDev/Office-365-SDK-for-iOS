/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@interface Metadata : NSObject

@property (nonatomic) NSString *Id;
@property (nonatomic) NSString *Uri;
@property (nonatomic) NSString *type;
- (instancetype)initWith:(NSDictionary *) data;

@end