/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSDirectoryObjectOperations.h"
#import "MSDirectoryObject.h"
@class MSDirectoryObjectFetcher;
@class MSDirectoryObjectCollectionFetcher;
@class MSDirectoryObjectFetcher;
@class MSDirectoryObjectCollectionFetcher;
@class MSDirectoryObjectCollectionFetcher;
@class MSDirectoryObjectCollectionFetcher;
@class MSDirectoryObjectCollectionFetcher;
@class MSDirectoryObjectCollectionFetcher;

#import "MSApplicationFetcher.h"	
#import "MSUserFetcher.h"	
#import "MSExtensionPropertyFetcher.h"	
#import "MSContactFetcher.h"	
#import "MSDeviceFetcher.h"	
#import "MSDeviceConfigurationFetcher.h"	
#import "MSDirectoryLinkChangeFetcher.h"	
#import "MSAppRoleAssignmentFetcher.h"	
#import "MSGroupFetcher.h"	
#import "MSDirectoryRoleFetcher.h"	
#import "MSDirectoryRoleTemplateFetcher.h"	
#import "MSServicePrincipalFetcher.h"	
#import "MSTenantDetailFetcher.h"	
/**
* The header for type MSDirectoryObjectFetcher.
*/

@protocol MSDirectoryObjectFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryObject* directoryObject, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryObject*, NSError * error))callback;
@end

@interface MSDirectoryObjectFetcher : MSODataEntityFetcher<MSDirectoryObjectFetcher>

-(MSDirectoryObjectOperations*) getOperations;
-(MSDirectoryObjectFetcher*) getcreatedOnBehalfOf;
-(MSDirectoryObjectCollectionFetcher*) getcreatedObjects;
-(MSDirectoryObjectFetcher*) getmanager;
-(MSDirectoryObjectCollectionFetcher*) getdirectReports;
-(MSDirectoryObjectCollectionFetcher*) getmembers;
-(MSDirectoryObjectCollectionFetcher*) getmemberOf;
-(MSDirectoryObjectCollectionFetcher*) getowners;
-(MSDirectoryObjectCollectionFetcher*) getownedObjects;
		
-(MSApplicationFetcher*) asApplication;	
		
-(MSUserFetcher*) asUser;	
		
-(MSExtensionPropertyFetcher*) asExtensionProperty;	
		
-(MSContactFetcher*) asContact;	
		
-(MSDeviceFetcher*) asDevice;	
		
-(MSDeviceConfigurationFetcher*) asDeviceConfiguration;	
		
-(MSDirectoryLinkChangeFetcher*) asDirectoryLinkChange;	
		
-(MSAppRoleAssignmentFetcher*) asAppRoleAssignment;	
		
-(MSGroupFetcher*) asGroup;	
		
-(MSDirectoryRoleFetcher*) asDirectoryRole;	
		
-(MSDirectoryRoleTemplateFetcher*) asDirectoryRoleTemplate;	
		
-(MSServicePrincipalFetcher*) asServicePrincipal;	
		
-(MSTenantDetailFetcher*) asTenantDetail;	
	
@end