/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODefaultDependencyResolver.h"
#import "MSOLoggerImpl.h"
#import "MSOJsonSerializerImpl.h"
#import "MSOHttpConnection.h"

@interface MSODefaultDependencyResolver()

@property (nonatomic)  id<MSOCredentialsFactory> mCredentialsFactory;

@end

@implementation MSODefaultDependencyResolver

-(void) setCredentialsFactory : (id<MSOCredentialsFactory>) credentialsFactory{
    self.mCredentialsFactory = credentialsFactory;
}

-(id<MSOHttpTransport>)getHttpTransport{
    return [MSOHttpConnection alloc];
}

-(id<MSOLogger>) getLogger{
    return [MSOLoggerImpl alloc];
}

-(id<MSOJsonSerializer>) getJsonSerializer{
    MSOJsonSerializerImpl* parser = [MSOJsonSerializerImpl alloc];
    [parser jsonSerializerImpl];
    
    return parser;
}

-(id<MSOCredentialsFactory>) getCredentialsFactory{
    return self.mCredentialsFactory;
}

@end