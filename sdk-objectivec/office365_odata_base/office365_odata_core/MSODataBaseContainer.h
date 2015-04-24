/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataExecutable.h"
#import "MSODataDependencyResolver.h"

@interface MSODataBaseContainer : MSODataExecutable

- (instancetype)initWithUrl:(NSString *)url dependencyResolver:(id<MSODataDependencyResolver>)resolver;

@end