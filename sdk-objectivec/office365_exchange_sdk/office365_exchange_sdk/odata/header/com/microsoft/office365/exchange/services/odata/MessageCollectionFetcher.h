/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "ODataCollectionFetcher.h"

@interface MessageCollectionFetcher : ODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;

@end