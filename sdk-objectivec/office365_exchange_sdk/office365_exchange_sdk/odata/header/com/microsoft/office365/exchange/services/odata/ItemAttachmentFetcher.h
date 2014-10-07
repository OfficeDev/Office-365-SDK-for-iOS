/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "ODataEntityFetcher.h"
#import "ItemFetcher.h"

@interface ItemAttachmentFetcher : ODataEntityFetcher

-(ItemAttachmentOperations*) getOperations;

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(ItemFetcher*) getItem;
@end