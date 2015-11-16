/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

//#import "MSFiles.h"
#import "MSOutlook.h"
#import "MSDirectoryServices.h"
#import "MSOneNote.h"
#import "MSGraph.h"
#import "MSDiscovery.h"

@interface BaseController : NSObject

- (void)getMailClient:(void(^)(MSOutlookClient *c))callback;
//- (void)getFilesClient:(void (^)(MSFilesClient *c))callback;
- (void)getDiscoveryClient:(void (^)(MSDiscoveryClient *c))callback;
- (void)getMSGraphClient:(void (^) (MSGraphClient* c))callback;
- (void)getOneNoteClient:(UIViewController *)viewController :(void(^)(MSOneNoteClient *c))callback;
- (MSOneNoteClient *)getOneNoteClient:(BOOL)authenticated;

@end
