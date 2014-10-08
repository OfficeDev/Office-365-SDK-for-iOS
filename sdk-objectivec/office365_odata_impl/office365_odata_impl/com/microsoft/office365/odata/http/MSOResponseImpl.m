/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOResponseImpl.h"

@interface MSOResponseImpl()

@property NSData* data;
@property int status;

@end

@implementation MSOResponseImpl

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