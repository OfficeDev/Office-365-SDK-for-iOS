/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"

@interface MSODataMediaEntityFetcher : MSODataEntityFetcher

-(id)initWithUrl : (NSString *)urlComponent parent:(id<MSODataReadable>)parent;
-(NSURLSessionDataTask*) getContentWithCallback:(void (^)(NSData* content, MSODataException * error))callback;
-(NSURLSessionDataTask*) putContent:(NSData*)content withCallback:(void (^)(NSInteger result, MSODataException * error))callback;

@end