/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataResponseImpl.h"

@interface MSODataResponseImpl()

@property NSData* data;
@property int status;

@end

@implementation MSODataResponseImpl

-(id)initWith : (NSData*)data : (int) status{
    self.data = data;
    self.status = status;
    return self;
}

-(int)getStatus{
    return self.status;
}

-(NSData *)getData{
    return self.data;
}

@end