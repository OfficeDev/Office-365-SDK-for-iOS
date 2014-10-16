/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <office365_odata_interfaces/MSODependencyResolver.h>
#import <office365_exchange_helpers/MSOOdataUrlImpl.h>

@interface MSODefaultDependencyResolver : NSObject<MSODependencyResolver>

-(void) setCredentialsFactory : (id<MSOCredentialsFactory>) credentialsFactory;

@end