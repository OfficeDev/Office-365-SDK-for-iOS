/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public protocol MSHttpTransport{

    init();
    func createRequest() -> MSRequest
    func execute(request : MSRequest, callback : ((response : MSResponse?, error : NSError?) -> Void?)) -> NSURLSessionDataTask
}