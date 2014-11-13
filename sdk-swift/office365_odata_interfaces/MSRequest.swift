/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public protocol MSRequest{
    
    init();
    func setContent (content : NSData?)
    func getContent() -> NSData
    func getHeaders()-> NSDictionary
    func setHeaders(headers : NSArray)
    func addHeader(name : String, value : String)
    func removeHeader(name : String)
    func getVerb() -> MSHttpVerb
    func setVerb(httpVerb : MSHttpVerb)
    func setUrl(url : String)
    func getUrl() -> NSString
}