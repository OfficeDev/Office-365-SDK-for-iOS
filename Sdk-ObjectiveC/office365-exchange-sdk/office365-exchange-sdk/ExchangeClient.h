//
//  ExchangeClient.h
//  office365-exchange-sdk
//
//  Created by Gustavo on 8/21/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <office365-base-sdk/BaseClient.h>

@interface ExchangeClient : BaseClient

- (NSURLSessionDataTask *)getMessages :(void (^)(NSMutableArray *messages, NSError *error))callback;

@end
