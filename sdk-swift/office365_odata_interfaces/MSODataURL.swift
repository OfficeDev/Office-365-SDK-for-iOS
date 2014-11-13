/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public protocol MSODataURL{
    
    init();
    func setBaseUrl(baseUrl : String)
    func appendPathComponent(value : String)
    func addQueryStringParameter(name : String, value : String)
    func toString() -> String
}