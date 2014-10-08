/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_odata_interfaces/MSOCredentials.h>
#import <office365_odata_interfaces/MSOCredentialsFactory.h>

@interface MSOCredentialsImpl : NSObject<MSOCredentialsFactory>
    
-(void)setCredentials : (id<MSOCredentials>) credentials;

@end