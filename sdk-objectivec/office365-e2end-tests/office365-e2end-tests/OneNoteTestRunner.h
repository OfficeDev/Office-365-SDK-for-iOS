/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseTestRunner.h"
#import "Test.h"

@interface OneNoteTestRunner : BaseTestRunner

@property (nonatomic, strong) MSOneNoteClient *client;

-(id)initWithClient:(MSOneNoteClient*)client;

@end
