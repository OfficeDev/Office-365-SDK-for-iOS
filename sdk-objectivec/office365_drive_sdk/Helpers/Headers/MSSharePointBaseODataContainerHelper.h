/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_odata_base/office365_odata_interfaces.h>

@interface MSSharePointBaseODataContainerHelper : NSObject

-(id<MSDependencyResolver>) getResolver;
-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver;
+(NSString*)generatePayload :(NSArray*) parameters : (id<MSDependencyResolver>) resolver;
-(NSURLSessionDataTask *)oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSHttpVerb)verb : (NSString*) productName :(void (^)(id<MSResponse>, NSError *))callback;
+(void)addCustomParametersToODataURL : (id<MSODataURL>) url : (NSDictionary*) parameters : (id<MSDependencyResolver>) resolver;
+(NSString*)getFunctionParameters :(NSDictionary*)parameters;
@end