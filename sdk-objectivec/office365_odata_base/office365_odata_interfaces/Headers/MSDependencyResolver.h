/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSHttpTransport.h"
#import "MSLogger.h"
#import "MSJsonSerializer.h"
#import "MSCredentialsFactory.h"
#import "MSODataURL.h"

@protocol MSDependencyResolver

@required
-(id<MSHttpTransport>)getHttpTransport;
-(id<MSLogger>) getLogger;
-(id<MSJsonSerializer>) getJsonSerializer;
-(id<MSCredentialsFactory>) getCredentialsFactory;
-(id<MSODataURL>) createODataURL;
-(NSString*)getPlatformUserAgent : (NSString*) productName;
@end