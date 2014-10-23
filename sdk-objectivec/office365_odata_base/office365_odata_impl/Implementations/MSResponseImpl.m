/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSResponseImpl.h"

@interface MSResponseImpl()

@property NSData* data;
@property int status;

@end

@implementation MSResponseImpl

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