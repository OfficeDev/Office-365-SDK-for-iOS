/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

#import <office365_files_sdk/office365_files_sdk.h>
#import <office365_odata_base/office365_odata_base.h>
#import <office365_exchange_sdk/office365_exchange_sdk.h>
#import <office365_discovery_sdk/office365_discovery_sdk.h>
#import <office365_onenote_sdk/office365_onenote_sdk.h>
#import <office365_graph_sdk/office365_graph_sdk.h>

@interface BaseController : NSObject

- (void)getMailClient:(void(^)(MSOutlookServicesClient *c))callback;
- (void)getSharePointClient:(void (^)(MSOneDriveServicesClient *c))callback;
- (void)getDiscoveryClient:(void (^)(MSDiscoveryClient *c))callback;
-(void)getMSGraphClient : (void (^) (MSGraphServiceClient* c))callback;
- (void)getOneNoteClient:(UIViewController *)viewController :(void(^)(MSOneNoteApiClient *c))callback;
- (MSOneNoteApiClient *)getOneNoteClient: (BOOL) authenticated;

@end