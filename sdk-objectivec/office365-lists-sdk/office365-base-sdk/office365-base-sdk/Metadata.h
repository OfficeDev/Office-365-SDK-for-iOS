//
//  Metadata.h
//  office365-base-sdk
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Metadata : NSObject

@property (nonatomic) NSString *Id;
@property (nonatomic) NSString *Uri;
@property (nonatomic) NSString *type;
- (instancetype)initWith:(NSDictionary *) data;

@end