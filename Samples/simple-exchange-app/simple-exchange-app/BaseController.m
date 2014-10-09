/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseController.h"

@implementation BaseController

-(EntityContainerClient*)getClient{
    
    MSODefaultDependencyResolver* resolver = [MSODefaultDependencyResolver alloc];
    MSOBasicCredentials* credentials = [MSOBasicCredentials alloc];
    [credentials addToken:@"di1ndWhhbnNAbXNvcGVudGVjaC5jY3NjdHAubmV0OkFEQ0dhaDE0ODc="];

    MSOCredentialsImpl* credentialsImpl = [MSOCredentialsImpl alloc];

    [credentialsImpl setCredentials:credentials];
    [resolver setCredentialsFactory:credentialsImpl];

    return  [[EntityContainerClient alloc] initWitUrl:@"https://sdfpilot.outlook.com/ews/odata" dependencyResolver:resolver];
}
@end
