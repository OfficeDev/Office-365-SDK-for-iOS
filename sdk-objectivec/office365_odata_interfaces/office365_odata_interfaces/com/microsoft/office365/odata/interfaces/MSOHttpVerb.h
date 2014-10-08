/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
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
} MSOHttpVerb;

@end