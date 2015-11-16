/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseTestRunner.h"
#import "Test.h"

@interface OneNoteTestRunner : BaseTestRunner

@property (nonatomic, strong) MSOneNoteApiClient *client;

-(id)initWithClient:(MSOneNoteApiClient*)client;

@end
