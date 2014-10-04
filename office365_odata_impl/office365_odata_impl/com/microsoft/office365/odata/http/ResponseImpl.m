//
//  ResponseImpl.m
//  office365-odata-impl
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
#import "ResponseImpl.h"

@interface ResponseImpl()

@property NSInputStream* stream;
@property int status;
@property NSArray* headers;

@end

@implementation ResponseImpl

-(id)initWith : (NSInputStream*)stream : (int) status : (NSArray*) headers{
    self.stream = stream;
    self.status = status;
    self.headers = headers;
    return self;
}

-(int)getStatus{
    return self.status;
}

-(NSInputStream *)getStream{
    return self.stream;
}

-(NSArray *)getHeaders{
    return self.headers;
}

-(NSArray*)getHeaders : (NSString*) headerName{
    return [self.headers objectAtIndex:0];
}

@end