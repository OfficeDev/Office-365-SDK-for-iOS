//
//  FilesTestRunner.h
//  office365-e2end-tests
//
//  Created by Anahi Hojnadel on 11/13/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "BaseTestRunner.h"
#import "Test.h"
#import "MSSharePointClient.h"
@interface FilesTestRunner : BaseTestRunner
@property MSSharePointClient *Client;

-(id)initWithClient : (MSSharePointClient*)client;
@end
