/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_odata_base/office365_odata_interfaces.h>

@interface MSODefaultDependencyResolver : NSObject<MSODependencyResolver>

-(void) setCredentialsFactory : (id<MSOCredentialsFactory>) credentialsFactory;

@end