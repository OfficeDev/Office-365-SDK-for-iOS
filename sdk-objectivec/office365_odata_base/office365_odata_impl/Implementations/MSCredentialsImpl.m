/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSCredentialsImpl.h"

@interface MSCredentialsImpl()

@property id<MSCredentials> mCredentials;

@end

@implementation MSCredentialsImpl


-(void)setCredentials : (id<MSCredentials>) credentials{
    self.mCredentials = credentials;
}

-(id<MSCredentials>)getCredentials{
    return self.mCredentials;
}

@end