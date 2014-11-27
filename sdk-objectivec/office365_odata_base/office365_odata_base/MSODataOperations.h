/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataExecutable.h"
#import "MSODataBaseContainerHelper.h"

@interface MSODataOperations : MSODataExecutable

-(id)initOperationWithUrl : (NSString*) urlComponent parent: (id<MSODataExecutable>) parent;

@end