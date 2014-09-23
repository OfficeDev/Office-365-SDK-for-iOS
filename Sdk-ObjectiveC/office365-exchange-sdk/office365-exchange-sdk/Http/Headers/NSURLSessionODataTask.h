
//
//  NSURLSessionDataTaskOdata.h
//  office365-exchange-sdk
//
//  Created by Gustavo on 9/12/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "BaseClient.h"

@interface NSURLSessionODataTask : BaseClient

@property Class ClassType;
@property id entity;
@property NSString* method;

-(NSURLSessionODataTask*)select : (NSString*) params;
-(NSURLSessionODataTask*)filter : (NSString*) params;
-(NSURLSessionODataTask*)top : (int) value;
-(NSURLSessionODataTask*)take : (int) value;
-(void)execute : (NSString *)method callback:(void (^)(id data, NSURLResponse *response, NSError *error))functionResult;
-(void)execute : (void (^)(id data, NSURLResponse *response, NSError *error))functionResult;

@end