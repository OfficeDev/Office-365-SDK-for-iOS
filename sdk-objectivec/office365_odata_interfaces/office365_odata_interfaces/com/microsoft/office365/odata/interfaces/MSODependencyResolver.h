/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSOHttpTransport.h"
#import "MSOLogger.h"
#import "MSOJsonSerializer.h"
#import "MSOCredentialsFactory.h"

@protocol MSODependencyResolver

@required
-(id<MSOHttpTransport>)getHttpTransport;
-(id<MSOLogger>) getLogger;
-(id<MSOJsonSerializer>) getJsonSerializer;
-(id<MSOCredentialsFactory>) getCredentialsFactory;

@end