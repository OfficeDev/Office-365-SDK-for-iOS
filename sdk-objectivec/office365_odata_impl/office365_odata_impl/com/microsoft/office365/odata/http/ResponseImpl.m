//
//  ResponseImpl.m
//  office365-odata-impl
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
#import "ResponseImpl.h"

@interface ResponseImpl()

@property NSData* data;
@property int status;

@end

@implementation ResponseImpl

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