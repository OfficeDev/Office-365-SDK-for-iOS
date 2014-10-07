//
//  CredentialsImpl.m
//  office365_odata_impl
//
//  Created by Gustavo on 10/7/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CredentialsImpl.h"

@interface CredentialsImpl()

@property (nonatomic)  Credentials* mCredentials;

@end

@implementation CredentialsImpl


-(void)setCredentials : (Credentials*) credentials{

    self.mCredentials = credentials;
}

-(Credentials*)getCredentials{
    return self.mCredentials;
}

@end