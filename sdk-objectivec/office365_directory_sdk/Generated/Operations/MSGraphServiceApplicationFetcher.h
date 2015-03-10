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

@class MSGraphServiceExtensionPropertyFetcher;;
@class MSGraphServiceExtensionPropertyCollectionFetcher;;
@class MSGraphServiceDirectoryObjectFetcher;;
@class MSGraphServiceDirectoryObjectCollectionFetcher;;
@class MSGraphServiceApplicationOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceApplicationFetcher.
*/


@protocol MSGraphServiceApplicationFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceApplication* application, MSODataException *error))callback;
-(NSURLSessionTask*) updateApplication:(id)entity withCallback:(void (^)(MSGraphServiceApplication*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteApplication:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceApplicationFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceApplicationFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceApplicationFetcher>)select : (NSString*) params;
-(id<MSGraphServiceApplicationFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceApplicationOperations*) getOperations;
-(MSGraphServiceExtensionPropertyCollectionFetcher*) getextensionProperties;

-(MSGraphServiceExtensionPropertyFetcher*) getextensionPropertiesById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectFetcher*) getcreatedOnBehalfOf;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getowners;

-(MSGraphServiceDirectoryObjectFetcher*) getownersById : (NSString*)_id;
@end

@interface MSGraphServiceApplicationFetcher : MSODataEntityFetcher<MSGraphServiceApplicationFetcher>

@end