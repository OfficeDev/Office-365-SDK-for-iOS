/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSODataResponse.h"

@interface MSODataException : NSError

@property id<MSODataResponse> response;
@property NSData* payload;

-(id)initWithResponse :(id<MSODataResponse>) response andMessage : (NSString*) message;
-(id)initWithResponse :(id<MSODataResponse>) response andError : (NSError*) error;

@end