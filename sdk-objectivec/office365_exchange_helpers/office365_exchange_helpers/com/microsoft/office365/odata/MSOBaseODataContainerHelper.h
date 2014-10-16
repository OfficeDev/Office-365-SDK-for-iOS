/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_odata_interfaces/MSODependencyResolver.h>
#import <office365_odata_interfaces/MSOResponse.h>

@interface MSOBaseODataContainerHelper : NSObject

-(id<MSODependencyResolver>) getResolver;
-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSODependencyResolver>) resolver;
+(NSString*)generatePayload :(NSArray*) parameters : (id<MSODependencyResolver>) resolver;
-(NSURLSessionDataTask *)oDataExecute:(id<MSOODataURL>)path :(NSData *)content :(MSOHttpVerb)verb : (NSString*) productName :(void (^)(id<MSOResponse>, NSError *))callback;
+(void)addCustomParametersToODataURL : (id<MSOODataURL>) url : (NSDictionary*) parameters : (id<MSODependencyResolver>) resolver;

@end