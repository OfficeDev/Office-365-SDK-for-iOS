/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseTestRunner.h"

@implementation BaseTestRunner

-(NSMutableArray*)getTests{return nil;}

-(NSURLSessionDataTask*)Run : (NSString*)testName completionHandler:(void (^) (id test))result{
    
    return nil;
}

@end