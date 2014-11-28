/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataResponseImpl.h"

@interface MSODataResponseImpl()

@property NSData* payload;
@property NSURLResponse* response;

@end

@implementation MSODataResponseImpl

-(id)initWithPayload : (NSData*)payload : (NSURLResponse*) response{
    self.payload = payload;
    self.response = response;
    return self;
}

-(int)getStatus{
    return (int)[(NSHTTPURLResponse*)self.response statusCode];
}

-(NSData *)getPayload{
    return self.payload;
}

-(NSURLResponse *)getResponse{
    return self.response;
}

@end