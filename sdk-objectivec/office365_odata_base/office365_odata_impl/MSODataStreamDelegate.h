//
//  MSODataStreamDelegate.h
//  office365_odata_base
//
//  Created by Gustavo on 3/5/15.
//  Copyright (c) 2015 Microsoft Open Technologies, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSODataStreamDelegate : NSObject<NSStreamDelegate>

@property NSInputStream* stream;
-(instancetype)initWithStream : (NSInputStream*) stream;

@end
