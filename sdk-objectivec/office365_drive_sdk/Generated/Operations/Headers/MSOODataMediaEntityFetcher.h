//
//  MSOODataMediaEntityFetcher.h
//  office365_drive_sdk
//
//  Created by Gustavo on 10/22/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "MSOODataEntityFetcher.h"

@interface MSOODataMediaEntityFetcher : MSOODataEntityFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*) getContent:(void (^)(NSData* content, NSError * error))callback;
-(NSURLSessionDataTask*) putContent:(NSData*)content :(void (^)(int result, NSError * error))callback;

@end