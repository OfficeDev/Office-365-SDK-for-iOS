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
#import "MSSampleContainerSampleEntity.h"
#import "MSSampleContainerEntityOperations.h"
#import "MSSampleContainerSampleComplexType.h"
#import "MSSampleContainerAnotherEntity.h"

/**
* The header for type MSSampleContainerSampleEntityOperations.
*/

@interface MSSampleContainerSampleEntityOperations : MSSampleContainerEntityOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)twoParamsActionsFirstIsEntityType : (MSSampleContainerSampleEntity *) anEntity : (bool) booleanParams : (void (^)(int returnValue, MSODataException *error))callback;			

-(NSURLSessionDataTask*)twoParamsActionsFirstIsEntityTypeRaw : (NSString*) anEntity : (NSString*) booleanParams : (void (^)(NSString*returnValue, MSODataException *error))callback;			

-(NSURLSessionDataTask*)twoParamsActionsFirstIsComplexType : (MSSampleContainerSampleComplexType *) complexType : (bool) booleanParams : (void (^)(int returnValue, MSODataException *error))callback;			

-(NSURLSessionDataTask*)twoParamsActionsFirstIsComplexTypeRaw : (NSString*) complexType : (NSString*) booleanParams : (void (^)(NSString*returnValue, MSODataException *error))callback;			

-(NSURLSessionDataTask*)twoParamsActionsFirstIsCollectionEntityType : (NSMutableArray<MSSampleContainerSampleEntity> *) collectionType : (bool) booleanParams : (void (^)(int returnValue, MSODataException *error))callback;			

-(NSURLSessionDataTask*)twoParamsActionsFirstIsCollectionEntityTypeRaw : (NSString*) collectionType : (NSString*) booleanParams : (void (^)(NSString*returnValue, MSODataException *error))callback;			

-(NSURLSessionDataTask*)twoParamsActionsFirstIsCollectionComplexType : (NSMutableArray<MSSampleContainerSampleComplexType> *) collectionType : (bool) booleanParams : (void (^)(int returnValue, MSODataException *error))callback;			

-(NSURLSessionDataTask*)twoParamsActionsFirstIsCollectionComplexTypeRaw : (NSString*) collectionType : (NSString*) booleanParams : (void (^)(NSString*returnValue, MSODataException *error))callback;			

@end