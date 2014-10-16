/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_odata_interfaces/MSODependencyResolver.h>

@interface BaseODataContainerHelper : NSObject

-(NSString*)generatePayload :(NSArray*) parameters : (id<MSODependencyResolver>) resolver;

@end