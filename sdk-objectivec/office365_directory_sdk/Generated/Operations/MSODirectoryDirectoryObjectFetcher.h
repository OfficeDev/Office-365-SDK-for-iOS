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

#import <office365_odata_base/office365_odata_base.h>
#import "MSODirectoryDirectoryObjectOperations.h"
#import "MSODirectoryDirectoryObject.h"
@class MSODirectoryDirectoryObjectFetcher;
@class MSODirectoryDirectoryObjectCollectionFetcher;
@class MSODirectoryDirectoryObjectFetcher;
@class MSODirectoryDirectoryObjectCollectionFetcher;
@class MSODirectoryDirectoryObjectCollectionFetcher;
@class MSODirectoryDirectoryObjectCollectionFetcher;
@class MSODirectoryDirectoryObjectCollectionFetcher;
@class MSODirectoryDirectoryObjectCollectionFetcher;


#import "MSODirectoryApplicationFetcher.h"
#import "MSODirectoryUserFetcher.h"
#import "MSODirectoryExtensionPropertyFetcher.h"
#import "MSODirectoryContactFetcher.h"
#import "MSODirectoryDeviceFetcher.h"
#import "MSODirectoryDeviceConfigurationFetcher.h"
#import "MSODirectoryDirectoryLinkChangeFetcher.h"
#import "MSODirectoryAppRoleAssignmentFetcher.h"
#import "MSODirectoryGroupFetcher.h"
#import "MSODirectoryDirectoryRoleFetcher.h"
#import "MSODirectoryDirectoryRoleTemplateFetcher.h"
#import "MSODirectoryServicePrincipalFetcher.h"
#import "MSODirectoryTenantDetailFetcher.h"
/**
* The header for type MSODirectoryDirectoryObjectFetcher.
*/

@protocol MSODirectoryDirectoryObjectFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSODirectoryDirectoryObject* directoryObject, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSODirectoryDirectoryObject*, NSError * error))callback;
@end

@interface MSODirectoryDirectoryObjectFetcher : MSODataEntityFetcher<MSODirectoryDirectoryObjectFetcher>

-(MSODirectoryDirectoryObjectOperations*) getOperations;

-(MSODirectoryDirectoryObjectFetcher*) getcreatedOnBehalfOf;

-(MSODirectoryDirectoryObjectCollectionFetcher*) getcreatedObjects;

-(MSODirectoryDirectoryObjectFetcher*) getmanager;

-(MSODirectoryDirectoryObjectCollectionFetcher*) getdirectReports;

-(MSODirectoryDirectoryObjectCollectionFetcher*) getmembers;

-(MSODirectoryDirectoryObjectCollectionFetcher*) getmemberOf;

-(MSODirectoryDirectoryObjectCollectionFetcher*) getowners;

-(MSODirectoryDirectoryObjectCollectionFetcher*) getownedObjects;

	
	
-(MSODirectoryApplicationFetcher*) asApplication;	
	
	
-(MSODirectoryUserFetcher*) asUser;	
	
	
-(MSODirectoryExtensionPropertyFetcher*) asExtensionProperty;	
	
	
-(MSODirectoryContactFetcher*) asContact;	
	
	
-(MSODirectoryDeviceFetcher*) asDevice;	
	
	
-(MSODirectoryDeviceConfigurationFetcher*) asDeviceConfiguration;	
	
	
-(MSODirectoryDirectoryLinkChangeFetcher*) asDirectoryLinkChange;	
	
	
-(MSODirectoryAppRoleAssignmentFetcher*) asAppRoleAssignment;	
	
	
-(MSODirectoryGroupFetcher*) asGroup;	
	
	
-(MSODirectoryDirectoryRoleFetcher*) asDirectoryRole;	
	
	
-(MSODirectoryDirectoryRoleTemplateFetcher*) asDirectoryRoleTemplate;	
	
	
-(MSODirectoryServicePrincipalFetcher*) asServicePrincipal;	
	
	
-(MSODirectoryTenantDetailFetcher*) asTenantDetail;	
	
@end