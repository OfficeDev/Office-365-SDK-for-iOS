/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "DefaultDependencyResolver.h"
#import "LoggerImpl.h"
#import "JsonSerializerImpl.h"
#import "HttpConnection.h"

@interface DefaultDependencyResolver()
@property (nonatomic)  CredentialsFactory* mCredentialsFactory;
@end
@implementation DefaultDependencyResolver

-(void) setCredentialsFactory : (CredentialsFactory*) credentialsFactory{
    self.mCredentialsFactory = credentialsFactory;
}

-(HttpTransport*)getHttpTransport{
    return [HttpConnection alloc];
}

-(Logger*) getLogger{
    return [LoggerImpl alloc];
}

-(JsonSerializer*) getJsonSerializer{
    JsonSerializerImpl* parser = [JsonSerializerImpl alloc];
    [parser jsonSerializerImpl];
    
    return parser;
}

-(CredentialsFactory*) getCredentialsFactory{
    return self.mCredentialsFactory;
}

@end