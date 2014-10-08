/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <office365_odata_interfaces/MSODependencyResolver.h>

@interface MSODefaultDependencyResolver : NSObject<MSODependencyResolver>

-(void) setCredentialsFactory : (id<MSOCredentialsFactory>) credentialsFactory;

@end