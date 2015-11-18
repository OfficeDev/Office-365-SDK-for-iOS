/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "BaseTestRunner.h"
#import "Test.h"

@interface FilesTestRunner : BaseTestRunner

@property (strong, nonatomic) MSFilesClient *client;

- (id)initWithClient:(MSFilesClient *)client;

@end