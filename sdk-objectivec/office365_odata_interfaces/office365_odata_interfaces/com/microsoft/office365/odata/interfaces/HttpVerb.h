//
//  Header.h
//  office365-odata-interfaces
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
@interface NSObject ()

typedef enum {
    GET,
    POST,
    DELETE,
    PUT,
    HEAD,
    OPTIONS,
    PATCH
} HttpVerb;

@end