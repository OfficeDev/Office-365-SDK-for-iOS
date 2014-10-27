/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookContactFetcher.h"


/**
* The implementation file for type MSOutlookContactFetcher.
*/


@implementation MSOutlookContactFetcher
-(MSOutlookContactOperations*) getOperations{
	return [[MSOutlookContactOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOutlookContact class]];
}


@end