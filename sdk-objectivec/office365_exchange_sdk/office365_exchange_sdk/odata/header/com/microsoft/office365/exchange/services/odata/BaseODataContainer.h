/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import <Foundation/Foundation.h>
#import "ODataExecutable.h"

@interface BaseODataContainer : ODataExecutable

-(id)initWith : (NSString *)url : (DependencyResolver*) resolver;

@end
