//
//  MSODataStreamDelegate.m
//  office365_odata_base
//
//  Created by Gustavo on 3/5/15.
//  Copyright (c) 2015 Microsoft Open Technologies, Inc. All rights reserved.
//

#import "MSODataStreamDelegate.h"

@interface MSODataStreamDelegate()

@property NSMutableData* data;
@property NSInteger* bytesRead;

@end

@implementation MSODataStreamDelegate

-(instancetype)initWithStream : (NSInputStream*) stream{
    
    self.stream = stream;
    [self.stream scheduleInRunLoop:[NSRunLoop currentRunLoop]
                       forMode:NSDefaultRunLoopMode];
    
    //[self.stream setDelegate:self];
    [self.stream open];
    
    return self;
}

-(void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode{
    
    switch(eventCode) {
        case NSStreamEventHasBytesAvailable:
        {
            if(!_data) {
                _data = [NSMutableData data];
            }
            uint8_t buf[1024];
            NSInteger len = 0;
            len = [(NSInputStream *)self.stream read:buf maxLength:1024];
            if(len) {
                [_data appendBytes:(const void *)buf length:len];
                _bytesRead = _bytesRead +len;
            } else {
                NSLog(@"no buffer!");
            }
            break;
        }
        case NSStreamEventEndEncountered:
        {
            [self.stream close];
            [self.stream removeFromRunLoop:[NSRunLoop currentRunLoop]
                                   forMode:NSDefaultRunLoopMode];
            self.stream = nil;
        
            break;
        }
        case NSStreamEventErrorOccurred:{
            break;
        }
        case NSStreamEventNone:{
            break;
        }
        case NSStreamEventOpenCompleted:
        {
            break;
        }
        case NSStreamEventHasSpaceAvailable:{
            break;
        }
    }
}

@end