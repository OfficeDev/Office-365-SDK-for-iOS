//
//  CredentialsImpl.h
//  office365_odata_impl
//
//  Created by Gustavo on 10/7/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <office365_odata_interfaces/Credentials.h>
#import <office365_odata_interfaces/CredentialsFactory.h>

@interface CredentialsImpl : CredentialsFactory
    
-(void)setCredentials : (Credentials*) credentials;

@end