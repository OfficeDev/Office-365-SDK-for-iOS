/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@protocol MSOResponse

@required
-(id)initWith : (NSData*)data : (int) status;
-(int)getStatus;
-(NSData *)getData;

@optional
-(void) close;

@end