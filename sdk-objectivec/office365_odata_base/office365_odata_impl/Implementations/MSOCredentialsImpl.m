/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCredentialsImpl.h"

@interface MSOCredentialsImpl()

@property id<MSOCredentials> mCredentials;

@end

@implementation MSOCredentialsImpl


-(void)setCredentials : (id<MSOCredentials>) credentials{
    self.mCredentials = credentials;
}

-(id<MSOCredentials>)getCredentials{
    return self.mCredentials;
}

@end