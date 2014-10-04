//
//  Ref.h
//  office365
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
#import <Foundation/Foundation.h>

@protocol  Ref

-(NSArray*) getHeaders;
-(NSArray*)getHeaders : (NSString*) headerName;
-(int)getStatus;
-(NSData*)getStream;
-(void) close;

@end
