/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@interface NSObject ()

typedef enum {
    GET,
    POST,
    DELETE,
    PUT,
    HEAD,
    OPTIONS,
    PATCH
} MSHttpVerb;

@end