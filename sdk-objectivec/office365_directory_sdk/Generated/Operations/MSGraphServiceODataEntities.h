/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSGraphServiceDirectoryObjectCollectionFetcher.h"
#import "MSGraphServiceDirectoryObjectCollectionOperations.h"
#import "MSGraphServiceDirectoryObjectFetcher.h"
#import "MSGraphServiceDirectoryObjectOperations.h"

#import "MSGraphServiceApplicationCollectionFetcher.h"
#import "MSGraphServiceApplicationCollectionOperations.h"
#import "MSGraphServiceApplicationFetcher.h"
#import "MSGraphServiceApplicationOperations.h"

#import "MSGraphServiceExtensionPropertyCollectionFetcher.h"
#import "MSGraphServiceExtensionPropertyCollectionOperations.h"
#import "MSGraphServiceExtensionPropertyFetcher.h"
#import "MSGraphServiceExtensionPropertyOperations.h"

#import "MSGraphServiceUserCollectionFetcher.h"
#import "MSGraphServiceUserCollectionOperations.h"
#import "MSGraphServiceUserFetcher.h"
#import "MSGraphServiceUserOperations.h"

#import "MSGraphServiceAppRoleAssignmentCollectionFetcher.h"
#import "MSGraphServiceAppRoleAssignmentCollectionOperations.h"
#import "MSGraphServiceAppRoleAssignmentFetcher.h"
#import "MSGraphServiceAppRoleAssignmentOperations.h"

#import "MSGraphServiceOAuth2PermissionGrantCollectionFetcher.h"
#import "MSGraphServiceOAuth2PermissionGrantCollectionOperations.h"
#import "MSGraphServiceOAuth2PermissionGrantFetcher.h"
#import "MSGraphServiceOAuth2PermissionGrantOperations.h"

#import "MSGraphServiceEventCollectionFetcher.h"
#import "MSGraphServiceEventCollectionOperations.h"
#import "MSGraphServiceEventFetcher.h"
#import "MSGraphServiceEventOperations.h"

#import "MSGraphServiceMessageCollectionFetcher.h"
#import "MSGraphServiceMessageCollectionOperations.h"
#import "MSGraphServiceMessageFetcher.h"
#import "MSGraphServiceMessageOperations.h"

#import "MSGraphServiceCalendarViewCollectionFetcher.h"
#import "MSGraphServiceCalendarViewCollectionOperations.h"
#import "MSGraphServiceCalendarViewFetcher.h"
#import "MSGraphServiceCalendarViewOperations.h"

#import "MSGraphServiceCalendarCollectionFetcher.h"
#import "MSGraphServiceCalendarCollectionOperations.h"
#import "MSGraphServiceCalendarFetcher.h"
#import "MSGraphServiceCalendarOperations.h"

#import "MSGraphServiceCalendarGroupCollectionFetcher.h"
#import "MSGraphServiceCalendarGroupCollectionOperations.h"
#import "MSGraphServiceCalendarGroupFetcher.h"
#import "MSGraphServiceCalendarGroupOperations.h"

#import "MSGraphServiceDriveCollectionFetcher.h"
#import "MSGraphServiceDriveCollectionOperations.h"
#import "MSGraphServiceDriveFetcher.h"
#import "MSGraphServiceDriveOperations.h"

#import "MSGraphServiceItemCollectionFetcher.h"
#import "MSGraphServiceItemCollectionOperations.h"
#import "MSGraphServiceItemFetcher.h"
#import "MSGraphServiceItemOperations.h"

#import "MSGraphServiceContactCollectionFetcher.h"
#import "MSGraphServiceContactCollectionOperations.h"
#import "MSGraphServiceContactFetcher.h"
#import "MSGraphServiceContactOperations.h"

#import "MSGraphServiceDeviceCollectionFetcher.h"
#import "MSGraphServiceDeviceCollectionOperations.h"
#import "MSGraphServiceDeviceFetcher.h"
#import "MSGraphServiceDeviceOperations.h"

#import "MSGraphServiceDeviceConfigurationCollectionFetcher.h"
#import "MSGraphServiceDeviceConfigurationCollectionOperations.h"
#import "MSGraphServiceDeviceConfigurationFetcher.h"
#import "MSGraphServiceDeviceConfigurationOperations.h"

#import "MSGraphServiceDirectoryLinkChangeCollectionFetcher.h"
#import "MSGraphServiceDirectoryLinkChangeCollectionOperations.h"
#import "MSGraphServiceDirectoryLinkChangeFetcher.h"
#import "MSGraphServiceDirectoryLinkChangeOperations.h"

#import "MSGraphServiceDirectoryRoleCollectionFetcher.h"
#import "MSGraphServiceDirectoryRoleCollectionOperations.h"
#import "MSGraphServiceDirectoryRoleFetcher.h"
#import "MSGraphServiceDirectoryRoleOperations.h"

#import "MSGraphServiceDirectoryRoleTemplateCollectionFetcher.h"
#import "MSGraphServiceDirectoryRoleTemplateCollectionOperations.h"
#import "MSGraphServiceDirectoryRoleTemplateFetcher.h"
#import "MSGraphServiceDirectoryRoleTemplateOperations.h"

#import "MSGraphServiceGroupCollectionFetcher.h"
#import "MSGraphServiceGroupCollectionOperations.h"
#import "MSGraphServiceGroupFetcher.h"
#import "MSGraphServiceGroupOperations.h"

#import "MSGraphServiceServicePrincipalCollectionFetcher.h"
#import "MSGraphServiceServicePrincipalCollectionOperations.h"
#import "MSGraphServiceServicePrincipalFetcher.h"
#import "MSGraphServiceServicePrincipalOperations.h"

#import "MSGraphServiceTenantDetailCollectionFetcher.h"
#import "MSGraphServiceTenantDetailCollectionOperations.h"
#import "MSGraphServiceTenantDetailFetcher.h"
#import "MSGraphServiceTenantDetailOperations.h"

#import "MSGraphServiceSubscribedSkuCollectionFetcher.h"
#import "MSGraphServiceSubscribedSkuCollectionOperations.h"
#import "MSGraphServiceSubscribedSkuFetcher.h"
#import "MSGraphServiceSubscribedSkuOperations.h"

#import "MSGraphServiceFileCollectionFetcher.h"
#import "MSGraphServiceFileCollectionOperations.h"
#import "MSGraphServiceFileFetcher.h"
#import "MSGraphServiceFileOperations.h"

#import "MSGraphServiceFolderCollectionFetcher.h"
#import "MSGraphServiceFolderCollectionOperations.h"
#import "MSGraphServiceFolderFetcher.h"
#import "MSGraphServiceFolderOperations.h"

#import "MSGraphServiceClient.h" 