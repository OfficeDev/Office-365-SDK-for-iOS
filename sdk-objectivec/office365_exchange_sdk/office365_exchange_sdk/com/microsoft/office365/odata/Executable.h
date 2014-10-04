//
//  Executable.h
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
@protocol Executable

-(NSURLSessionDataTask*)execute :(void (^)(id entity, NSURLResponse *response, NSError *error))callback;

@end

@interface Executable<Executable>
@end