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

@class MSGraphServiceAssignedLicense;
@class MSGraphServiceAssignedPlan;
@class MSGraphServicePasswordProfile;
@class MSGraphServiceProvisionedPlan;
@class MSGraphServiceProvisioningError;
@class NSStream;
@class MSGraphServiceAppRoleAssignment;
@class MSGraphServiceOAuth2PermissionGrant;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceEvent;
@class MSGraphServiceMessage;
@class MSGraphServiceCalendarView;
@class MSGraphServiceCalendar;
@class MSGraphServiceCalendar;
@class MSGraphServiceCalendarGroup;
@class MSGraphServiceDrive;
@class MSGraphServiceItem;


#import "MSGraphServiceProtocols.h"
#import "MSGraphServiceDirectoryObject.h"
#import <Foundation/Foundation.h>


/**
* The header for type User.
*/

@interface MSGraphServiceUser : MSGraphServiceDirectoryObject

@property BOOL accountEnabled;
@property NSMutableArray<MSGraphServiceAssignedLicense> *assignedLicenses;
@property NSMutableArray<MSGraphServiceAssignedPlan> *assignedPlans;
@property NSString *city;
@property NSString *country;
@property NSString *department;
@property BOOL dirSyncEnabled;
@property NSString *displayName;
@property NSString *facsimileTelephoneNumber;
@property NSString *givenName;
@property NSString *immutableId;
@property NSString *jobTitle;
@property NSDate *lastDirSyncTime;
@property NSString *mail;
@property NSString *mailNickname;
@property NSString *mobile;
@property NSString *onPremisesSecurityIdentifier;
@property NSMutableArray *otherMails;
@property NSString *passwordPolicies;
@property MSGraphServicePasswordProfile *passwordProfile;
@property NSString *physicalDeliveryOfficeName;
@property NSString *postalCode;
@property NSString *preferredLanguage;
@property NSMutableArray<MSGraphServiceProvisionedPlan> *provisionedPlans;
@property NSMutableArray<MSGraphServiceProvisioningError> *provisioningErrors;
@property NSMutableArray *proxyAddresses;
@property NSString *sipProxyAddress;
@property NSString *state;
@property NSString *streetAddress;
@property NSString *surname;
@property NSString *telephoneNumber;
@property NSStream *thumbnailPhoto;
@property NSString *usageLocation;
@property NSString *userPrincipalName;
@property NSString *userType;
@property NSString *MailboxGuid;
@property NSString *AboutMe;
@property NSString *Alias;
@property NSDate *Birthday;
@property NSDate *HireDate;
@property NSMutableArray *Interests;
@property NSString *MySite;
@property NSMutableArray *PastProjects;
@property NSString *PreferredName;
@property NSString *PrincipalName;
@property NSMutableArray *Responsibilities;
@property NSMutableArray *Schools;
@property NSMutableArray *Skills;
@property NSMutableArray *Tags;
@property NSMutableArray<MSGraphServiceAppRoleAssignment> *appRoleAssignments;
@property NSMutableArray<MSGraphServiceOAuth2PermissionGrant> *oauth2PermissionGrants;
@property NSMutableArray<MSGraphServiceDirectoryObject> *ownedDevices;
@property NSMutableArray<MSGraphServiceDirectoryObject> *registeredDevices;
@property MSGraphServiceDirectoryObject *manager;
@property NSMutableArray<MSGraphServiceDirectoryObject> *directReports;
@property NSMutableArray<MSGraphServiceDirectoryObject> *memberOf;
@property NSMutableArray<MSGraphServiceDirectoryObject> *createdObjects;
@property NSMutableArray<MSGraphServiceDirectoryObject> *ownedObjects;
@property NSMutableArray<MSGraphServiceEvent> *Events;
@property NSMutableArray<MSGraphServiceMessage> *Messages;
@property NSMutableArray<MSGraphServiceCalendarView> *CalendarView;
@property NSMutableArray<MSGraphServiceCalendar> *Calendars;
@property MSGraphServiceCalendar *Calendar;
@property NSMutableArray<MSGraphServiceCalendarGroup> *CalendarGroups;
@property MSGraphServiceDrive *drive;
@property NSMutableArray<MSGraphServiceItem> *files;

@end