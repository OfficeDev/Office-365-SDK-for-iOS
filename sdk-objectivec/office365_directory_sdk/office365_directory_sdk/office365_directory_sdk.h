//
//  office365_directory_sdk.h
//  office365_directory_sdk
//
//  Created by Gustavo on 10/24/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for office365_directory_sdk.
FOUNDATION_EXPORT double office365_directory_sdkVersionNumber;

//! Project version string for office365_directory_sdk.
FOUNDATION_EXPORT const unsigned char office365_directory_sdkVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <office365_directory_sdk/PublicHeader.h>

#import <office365_directory_sdk/MSDirectoryApplicationCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryApplicationCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryApplicationFetcher.h>
#import <office365_directory_sdk/MSDirectoryApplicationOperations.h>
#import <office365_directory_sdk/MSDirectoryAppRoleAssignmentCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryAppRoleAssignmentCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryAppRoleAssignmentFetcher.h>
#import <office365_directory_sdk/MSDirectoryAppRoleAssignmentOperations.h>
#import <office365_directory_sdk/MSDirectoryBaseODataContainer.h>
#import <office365_directory_sdk/MSDirectoryClient.h>
#import <office365_directory_sdk/MSDirectoryContactCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryContactCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryContactFetcher.h>
#import <office365_directory_sdk/MSDirectoryContactOperations.h>
#import <office365_directory_sdk/MSDirectoryDeviceCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryDeviceCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryDeviceConfigurationCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryDeviceConfigurationCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryDeviceConfigurationFetcher.h>
#import <office365_directory_sdk/MSDirectoryDeviceConfigurationOperations.h>
#import <office365_directory_sdk/MSDirectoryDeviceFetcher.h>
#import <office365_directory_sdk/MSDirectoryDeviceOperations.h>
#import <office365_directory_sdk/MSDirectoryDirectoryLinkChangeCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryDirectoryLinkChangeCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryDirectoryLinkChangeFetcher.h>
#import <office365_directory_sdk/MSDirectoryDirectoryLinkChangeOperations.h>
#import <office365_directory_sdk/MSDirectoryDirectoryObjectCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryDirectoryObjectCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryDirectoryObjectFetcher.h>
#import <office365_directory_sdk/MSDirectoryDirectoryObjectOperations.h>
#import <office365_directory_sdk/MSDirectoryDirectoryRoleCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryDirectoryRoleCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryDirectoryRoleFetcher.h>
#import <office365_directory_sdk/MSDirectoryDirectoryRoleOperations.h>
#import <office365_directory_sdk/MSDirectoryDirectoryRoleTemplateCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryDirectoryRoleTemplateCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryDirectoryRoleTemplateFetcher.h>
#import <office365_directory_sdk/MSDirectoryDirectoryRoleTemplateOperations.h>
#import <office365_directory_sdk/MSDirectoryExtensionPropertyCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryExtensionPropertyCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryExtensionPropertyFetcher.h>
#import <office365_directory_sdk/MSDirectoryExtensionPropertyOperations.h>
#import <office365_directory_sdk/MSDirectoryGroupCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryGroupCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryGroupFetcher.h>
#import <office365_directory_sdk/MSDirectoryGroupOperations.h>
#import <office365_directory_sdk/MSDirectoryOAuth2PermissionGrantCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryOAuth2PermissionGrantCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryOAuth2PermissionGrantFetcher.h>
#import <office365_directory_sdk/MSDirectoryOAuth2PermissionGrantOperations.h>
#import <office365_directory_sdk/MSDirectoryODataCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryODataEntityFetcher.h>
#import <office365_directory_sdk/MSDirectoryODataExecutable.h>
#import <office365_directory_sdk/MSDirectoryODataMediaEntityFetcher.h>
#import <office365_directory_sdk/MSDirectoryODataOperations.h>
#import <office365_directory_sdk/MSDirectoryServicePrincipalCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryServicePrincipalCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryServicePrincipalFetcher.h>
#import <office365_directory_sdk/MSDirectoryServicePrincipalOperations.h>
#import <office365_directory_sdk/MSDirectorySubscribedSkuCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectorySubscribedSkuCollectionOperations.h>
#import <office365_directory_sdk/MSDirectorySubscribedSkuFetcher.h>
#import <office365_directory_sdk/MSDirectorySubscribedSkuOperations.h>
#import <office365_directory_sdk/MSDirectoryTenantDetailCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryTenantDetailCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryTenantDetailFetcher.h>
#import <office365_directory_sdk/MSDirectoryTenantDetailOperations.h>
#import <office365_directory_sdk/MSDirectoryUserCollectionFetcher.h>
#import <office365_directory_sdk/MSDirectoryUserCollectionOperations.h>
#import <office365_directory_sdk/MSDirectoryUserFetcher.h>
#import <office365_directory_sdk/MSDirectoryUserOperations.h>

#import <office365_directory_sdk/MSDirectoryBaseODataContainerHelper.h>
#import <office365_directory_sdk/MSDirectoryEntityFetcherHelper.h>