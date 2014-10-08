/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <office365_odata_interfaces/MSODependencyResolver.h>
#import "ODataExecutable.h"

@interface ODataOperations : ODataExecutable

-(id)initOperationWith : (NSString*) urlComponent : (ODataExecutable*) parent;

@end
