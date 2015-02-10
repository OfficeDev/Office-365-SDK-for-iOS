/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSODataHttpTransport.h"
#import "MSODataLogger.h"
#import "MSODataJsonSerializer.h"
#import "MSODataCredentials.h"
#import "MSODataURL.h"

@protocol MSODataDependencyResolver

@required
-(id<MSODataHttpTransport>)getHttpTransport;
-(id<MSODataLogger>) getLogger;
-(id<MSODataJsonSerializer>) getJsonSerializer;
-(id<MSODataCredentials>)getCredentials;
-(id<MSODataRequest>)createODataRequest;
-(NSString*)getPlatformUserAgent : (NSString*) productName;

@end