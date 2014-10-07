//
//  RequestImpl.h
//  office365_odata_impl
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
#import <office365_odata_interfaces/Request.h>

@interface  RequestImpl : Request

-(id)init;
-(NSMutableURLRequest*)getMutableRequest;

@end