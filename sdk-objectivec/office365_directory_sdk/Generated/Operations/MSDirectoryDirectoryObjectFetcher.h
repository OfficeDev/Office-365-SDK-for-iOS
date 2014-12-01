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
#import "MSDirectoryDirectoryObjectOperations.h"
#import "MSDirectoryDirectoryObject.h"
@class MSDirectoryDirectoryObjectFetcher;
@class MSDirectoryDirectoryObjectCollectionFetcher;
@class MSDirectoryDirectoryObjectFetcher;
@class MSDirectoryDirectoryObjectCollectionFetcher;
@class MSDirectoryDirectoryObjectCollectionFetcher;
@class MSDirectoryDirectoryObjectCollectionFetcher;
@class MSDirectoryDirectoryObjectCollectionFetcher;
@class MSDirectoryDirectoryObjectCollectionFetcher;


#import "MSDirectoryApplicationFetcher.h"
#import "MSDirectoryUserFetcher.h"
#import "MSDirectoryExtensionPropertyFetcher.h"
#import "MSDirectoryContactFetcher.h"
#import "MSDirectoryDeviceFetcher.h"
#import "MSDirectoryDeviceConfigurationFetcher.h"
#import "MSDirectoryDirectoryLinkChangeFetcher.h"
#import "MSDirectoryAppRoleAssignmentFetcher.h"
#import "MSDirectoryGroupFetcher.h"
#import "MSDirectoryDirectoryRoleFetcher.h"
#import "MSDirectoryDirectoryRoleTemplateFetcher.h"
#import "MSDirectoryServicePrincipalFetcher.h"
#import "MSDirectoryTenantDetailFetcher.h"
/**
* The header for type MSDirectoryDirectoryObjectFetcher.
*/

@protocol MSDirectoryDirectoryObjectFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryDirectoryObject* directoryObject, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateDirectoryObject:(id)entity withCallback:(void (^)(MSDirectoryDirectoryObject*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteDirectoryObject:(void (^)(int status, MSODataException * error))callback;
-(id<MSDirectoryDirectoryObjectFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryDirectoryObjectFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSDirectoryDirectoryObjectFetcher : MSODataEntityFetcher<MSDirectoryDirectoryObjectFetcher>

-(MSDirectoryDirectoryObjectOperations*) getOperations;

-(MSDirectoryDirectoryObjectFetcher*) getcreatedOnBehalfOf;

-(MSDirectoryDirectoryObjectCollectionFetcher*) getcreatedObjects;

-(MSDirectoryDirectoryObjectFetcher*) getmanager;

-(MSDirectoryDirectoryObjectCollectionFetcher*) getdirectReports;

-(MSDirectoryDirectoryObjectCollectionFetcher*) getmembers;

-(MSDirectoryDirectoryObjectCollectionFetcher*) getmemberOf;

-(MSDirectoryDirectoryObjectCollectionFetcher*) getowners;

-(MSDirectoryDirectoryObjectCollectionFetcher*) getownedObjects;

	
	
-(MSDirectoryApplicationFetcher*) asApplication;	
	
	
-(MSDirectoryUserFetcher*) asUser;	
	
	
-(MSDirectoryExtensionPropertyFetcher*) asExtensionProperty;	
	
	
-(MSDirectoryContactFetcher*) asContact;	
	
	
-(MSDirectoryDeviceFetcher*) asDevice;	
	
	
-(MSDirectoryDeviceConfigurationFetcher*) asDeviceConfiguration;	
	
	
-(MSDirectoryDirectoryLinkChangeFetcher*) asDirectoryLinkChange;	
	
	
-(MSDirectoryAppRoleAssignmentFetcher*) asAppRoleAssignment;	
	
	
-(MSDirectoryGroupFetcher*) asGroup;	
	
	
-(MSDirectoryDirectoryRoleFetcher*) asDirectoryRole;	
	
	
-(MSDirectoryDirectoryRoleTemplateFetcher*) asDirectoryRoleTemplate;	
	
	
-(MSDirectoryServicePrincipalFetcher*) asServicePrincipal;	
	
	
-(MSDirectoryTenantDetailFetcher*) asTenantDetail;	
	
@end