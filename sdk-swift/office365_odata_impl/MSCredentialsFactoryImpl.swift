/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public class MSCredentialsFactoryImpl : MSCredentialsFactory{

    private let credential : MSCredentials?;

    public init(credentials : MSCredentials){
        credential = credentials;
    }
    
    public func getCredentials() -> MSCredentials{
        return self.credential!;
    }
}