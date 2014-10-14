/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <office365_odata_interfaces/MSODependencyResolver.h>
#import "MSOODataExecutable.h"

@interface MSOODataOperations : NSObject<MSOODataExecutable>

-(id)initOperationWithUrl : (NSString*) urlComponent Parent: (id<MSOODataExecutable>) parent;

@end
