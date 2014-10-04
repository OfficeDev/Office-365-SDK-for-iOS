//
//  Header.h
//  office365-odata-interfaces
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Response : NSObject

-(NSArray*) getHeaders;
-(NSArray*)getHeaders : (NSString*) headerName;
-(int)getStatus;
-(NSInputStream*)getStream;
-(void) close;

@end