/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataExecutable.h"
#import "MSODataEntityFetcher.h"
#import "MSODataDependencyResolver.h"

#define __message_msg(message)

@protocol MSODataCollectionFetcher<MSODataExecutable>

@optional
- (id<MSODataCollectionFetcher>)addCustomParametersWithName:(NSString *)name value:(id)value;
- (id<MSODataCollectionFetcher>)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;

@end

@interface MSODataCollectionFetcher : MSODataExecutable<MSODataCollectionFetcher>

- (MSODataCollectionFetcher *)select:(NSString *)params;
- (MSODataCollectionFetcher *)filter:(NSString *)params;
- (MSODataCollectionFetcher *)top:(int)value;
- (MSODataCollectionFetcher *)skip:(int)value;
- (MSODataCollectionFetcher *)expand:(NSString *)value;
- (MSODataCollectionFetcher *)orderBy:(NSString *)params;
- (MSODataCollectionFetcher *)search:(NSString *)params;

- (NSURLSessionTask *)addEntity:(id)entity callback:(void (^)(id entityAdded, MSODataException *exception))callback;

- (MSODataEntityFetcher *)getById:(NSString *)theId;

- (NSURLSessionTask *)count:(void (^)(NSInteger, MSODataException *))callback; __message_msg("This method will override all the odata operators -> select, top, filter, orderby, skip, expand.");

- (NSURLSessionTask *)addEntityRaw:(NSString *)payload callback:(void (^)(NSString *result, MSODataException *exception))callback;
    
@end
