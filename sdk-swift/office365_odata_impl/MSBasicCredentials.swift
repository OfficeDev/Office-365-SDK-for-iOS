/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public class MSBasicCredentials : MSCredentials{

    private var token : String = "";
    
    public func addToken(token : String){
        self.token = token;
    }
    
    public func prepareRequest(request : MSRequest){
        request.addHeader("Authorization", value: "Basic " + self.token)
    }
}