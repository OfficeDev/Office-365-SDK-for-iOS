//
//  BaseController.h
//  office365-e2end-tests
//
//  Created by Lagash on 10/20/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <office365_odata_base/office365_odata_base.h>
#import <office365_exchange_sdk/MSOEntityContainerClient.h>


@interface BaseController : NSObject

-(void)getMailClient : (void (^) (MSOEntityContainerClient* ))callback;

@end
