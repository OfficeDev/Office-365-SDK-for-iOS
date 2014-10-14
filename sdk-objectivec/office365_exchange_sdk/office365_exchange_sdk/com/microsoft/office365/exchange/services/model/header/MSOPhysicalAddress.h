/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


@interface MSOPhysicalAddress : NSObject
@property NSString *Street;
@property NSString *City;
@property NSString *State;
@property NSString *CountryOrRegion;
@property NSString *PostalCode;

@end