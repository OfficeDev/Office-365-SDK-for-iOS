//
//  MSSampleContaunerEntityWithEnum.h
//  office365_UnitTests
//
//  Created by Gustavo on 2/4/15.
//  Copyright (c) 2015 MSOpentech. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MSSampleContainerEnum

@end

@interface MSSampleContaunerEntityWithEnum : NSObject

@property NSString* Name;
@property NSMutableArray<MSSampleContainerEnum>* enums;

@end