/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public class MSRequestImpl : MSRequest{

    private var request =  NSMutableURLRequest();
    private var httpVerb : MSHttpVerb?;
    
    required public init(){
    
    }
    
    public func setContent(content: NSData?) {
        
        self.request.HTTPBody = content;
    }
  
    public func getContent() -> NSData {
        
        return self.request.HTTPBody!;
    }
    
    public func getHeaders() -> NSDictionary {
        
        return self.request.allHTTPHeaderFields!;
    }
    
    public func setHeaders(headers: NSArray) {

        for dicc in headers{
            var diccionary = dicc as NSDictionary;
            self.request.addValue(diccionary.allKeys[0] as? String, forHTTPHeaderField: diccionary.allValues[0] as String);
        }
    }
    
    public func addHeader(name: String, value: String) {
        self.request.addValue(value, forHTTPHeaderField: name);
    }
    
    public func removeHeader(name: String) {
        
    }
    
    public func getVerb() -> MSHttpVerb {
        
        return self.httpVerb!;
    }
    
    public func setVerb(httpVerb: MSHttpVerb) {
     
        self.request.HTTPMethod = httpVerb.rawValue;
    }
    
    public func setUrl(url: String) {
    
        self.request.URL = NSURL(string: url);
    }
    
    
    public func getMutableRequest() -> NSMutableURLRequest{
        
        return self.request;
    }
    
    public func getUrl() -> NSString {
        
        return self.request.URL!.absoluteString!;
    }
}