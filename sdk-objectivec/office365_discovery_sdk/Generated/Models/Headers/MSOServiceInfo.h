/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


/**
* The header for type ServiceInfo.
*/

@interface MSOServiceInfo : NSObject
@property NSString *Capability;
@property NSString *EntityKey;
@property NSString *ProviderId;
@property NSString *ProviderName;
@property int ServiceAccountType;
@property NSString *ServiceApiVersion;
@property NSString *ServiceEndpointUri;
@property NSString *ServiceId;
@property NSString *ServiceName;
@property NSString *ServiceResourceId;

@end