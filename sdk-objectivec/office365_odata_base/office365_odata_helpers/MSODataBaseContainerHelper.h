/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_odata_base/office365_odata_interfaces.h>

@interface MSODataBaseContainerHelper : NSObject

-(id<MSODataDependencyResolver>) getResolver;
-(id)initWithUrl : (NSString *)url  dependencyResolver : (id<MSODataDependencyResolver>) resolver;
+(NSString*)generatePayload :(NSArray*) parameters : (id<MSODataDependencyResolver>) resolver;
+(void)addCustomParametersToODataURL : (id<MSODataURL>) url : (NSDictionary*) parameters : (id<MSODataDependencyResolver>) resolver;
+(NSString*)getFunctionParameters :(NSDictionary*)parameters;

@end