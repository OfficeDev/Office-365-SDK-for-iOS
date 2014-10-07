/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <office365_odata_interfaces/DependencyResolver.h>

@interface DefaultDependencyResolver : DependencyResolver

-(void) setCredentialsFactory : (CredentialsFactory*) credentialsFactory;

@end