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

@class MSGraphServiceApplicationFetcher;;
@class MSGraphServiceExtensionPropertyFetcher;;
@class MSGraphServiceUserFetcher;;
@class MSGraphServiceAppRoleAssignmentFetcher;;
@class MSGraphServiceContactFetcher;;
@class MSGraphServiceDeviceFetcher;;
@class MSGraphServiceDeviceConfigurationFetcher;;
@class MSGraphServiceDirectoryLinkChangeFetcher;;
@class MSGraphServiceDirectoryRoleFetcher;;
@class MSGraphServiceDirectoryRoleTemplateFetcher;;
@class MSGraphServiceGroupFetcher;;
@class MSGraphServiceServicePrincipalFetcher;;
@class MSGraphServiceTenantDetailFetcher;;
@class MSGraphServiceDirectoryObjectOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceDirectoryObjectFetcher.
*/


@protocol MSGraphServiceDirectoryObjectFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceDirectoryObject* directoryObject, MSODataException *error))callback;
-(NSURLSessionTask*) updateDirectoryObject:(id)entity withCallback:(void (^)(MSGraphServiceDirectoryObject*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteDirectoryObject:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceDirectoryObjectFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceDirectoryObjectFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceDirectoryObjectFetcher>)select : (NSString*) params;
-(id<MSGraphServiceDirectoryObjectFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceDirectoryObjectOperations*) getOperations;
	
-(MSGraphServiceApplicationFetcher*) asApplication;	
	
-(MSGraphServiceExtensionPropertyFetcher*) asExtensionProperty;	
	
-(MSGraphServiceUserFetcher*) asUser;	
	
-(MSGraphServiceAppRoleAssignmentFetcher*) asAppRoleAssignment;	
	
-(MSGraphServiceContactFetcher*) asContact;	
	
-(MSGraphServiceDeviceFetcher*) asDevice;	
	
-(MSGraphServiceDeviceConfigurationFetcher*) asDeviceConfiguration;	
	
-(MSGraphServiceDirectoryLinkChangeFetcher*) asDirectoryLinkChange;	
	
-(MSGraphServiceDirectoryRoleFetcher*) asDirectoryRole;	
	
-(MSGraphServiceDirectoryRoleTemplateFetcher*) asDirectoryRoleTemplate;	
	
-(MSGraphServiceGroupFetcher*) asGroup;	
	
-(MSGraphServiceServicePrincipalFetcher*) asServicePrincipal;	
	
-(MSGraphServiceTenantDetailFetcher*) asTenantDetail;	
@end

@interface MSGraphServiceDirectoryObjectFetcher : MSODataEntityFetcher<MSGraphServiceDirectoryObjectFetcher>

@end