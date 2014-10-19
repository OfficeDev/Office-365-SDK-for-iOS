/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSOCredentials.h"

@interface MSOBasicCredentials : NSObject<MSOCredentials>

-(void)addToken : (NSString*) token;

@end
