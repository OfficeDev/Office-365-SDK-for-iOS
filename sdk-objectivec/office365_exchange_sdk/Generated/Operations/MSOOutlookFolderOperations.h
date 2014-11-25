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
#import "MSOOutlookFolder.h"
#import "MSOOutlookEntityOperations.h"

#import "MSOOutlookFolder.h"
#import "MSOOutlookMessage.h"

/**
* The header for type MSOOutlookFolderOperations.
*/

@interface MSOOutlookFolderOperations : MSOOutlookEntityOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)copy : (NSString *) destinationId : (void (^)(MSOOutlookFolder *folder, NSError *error))callback;			

-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSOOutlookFolder *folder, NSError *error))callback;			

@end