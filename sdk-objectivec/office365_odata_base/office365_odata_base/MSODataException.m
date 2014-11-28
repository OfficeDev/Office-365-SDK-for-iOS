/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataException.h"

@implementation MSODataException

-(id)initWithResponse:(id<MSODataResponse>)response andMessage:(NSString *)message{
    self.response = response;
    NSArray * msj = [NSJSONSerialization JSONObjectWithData:[response getPayload] options: NSJSONReadingMutableContainers error:nil];
    return [super initWithDomain: [[[response getResponse] URL] path] code:[(NSHTTPURLResponse*)response statusCode] userInfo:(NSDictionary*)msj];
}

-(id)initWithResponse:(id<MSODataResponse>)response andError:(NSError *)error{
    self.response = response;
    return [super initWithDomain:error.domain code:error.code userInfo:error.userInfo];
}
@end
