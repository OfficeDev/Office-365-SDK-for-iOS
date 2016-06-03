/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_odata_base/office365_odata_base.h>

@interface AuthManager : NSObject

@property (strong, nonatomic, readonly)ADALDependencyResolver *dependencyResolver;

+ (instancetype)instance;
- (void)clearCredentials;

@end