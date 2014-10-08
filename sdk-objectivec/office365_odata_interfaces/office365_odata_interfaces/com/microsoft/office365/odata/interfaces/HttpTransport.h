//
//  HttpTransport.h
//  office365-odata-interfaces
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Request.h"
#import "Response.h"

@interface HttpTransport : NSObject

-(Request*) createRequest;
-(NSURLSessionDataTask *)execute:(Request *)request :(void (^)(Response * r, NSError *e))callback;

@end