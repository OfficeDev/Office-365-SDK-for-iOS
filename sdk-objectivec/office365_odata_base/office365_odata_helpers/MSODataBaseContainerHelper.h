/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@protocol MSODataDependencyResolver;
@protocol MSODataRequest;

@interface MSODataBaseContainerHelper : NSObject

@property (copy, nonatomic) id<MSODataDependencyResolver> resolver;

- (id)initWithUrl:(NSString *)url dependencyResolver:(id<MSODataDependencyResolver>)resolver;

+ (NSString *)generatePayloadWithParameters:(NSArray *)parameters
                         dependencyResolver:(id<MSODataDependencyResolver>)resolver;

+ (void)addCustomParametersToODataURLWithRequest:(id<MSODataRequest>)request
                                      parameters:(NSDictionary *)parameters
                                         headers:(NSDictionary *)headers
                              dependencyResolver:(id<MSODataDependencyResolver>)resolver;

+ (NSString *)getFunctionParameters:(NSDictionary *)parameters;

@end