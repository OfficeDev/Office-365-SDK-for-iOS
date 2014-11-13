/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public class MSODataURLImpl : MSODataURL{

    private var queryStringParameters = NSMutableDictionary();
    private var pathComponents = NSMutableArray();
    private var baseUrl = String();
    
    required public init(){
    }
    
    private func addTrailingSlash(s : String) -> String{
      
        var theString = s;
        if(!s.hasSuffix("/")){
            theString += "/";
        }
        
        return theString;
    }
    
    private func removeTrailingSlash(s : String) -> String{
        
        var theString : NSString = s;
        
        if(s.hasSuffix("/")){
            return theString.substringWithRange(NSMakeRange(0, theString.length - 1));
        }
        
        if (s.hasSuffix("%2F")) {
            return theString.substringWithRange(NSMakeRange(0, theString.length - 3));
        }
        
        return s;
    }
    
    public func setBaseUrl(baseUrl: String) {
        
        var urlParts = baseUrl.componentsSeparatedByString("?");
        self.baseUrl = self.removeTrailingSlash(urlParts[0] as String);
        
        if(urlParts.count > 1){
        
            var parameters = (urlParts[1] as String).componentsSeparatedByString("&");
            
            for kv in parameters{
                
                var parameterParts = kv.componentsSeparatedByString("=");
                var key = parameters[0] as String;
                var value = "";
                
                if(parameterParts.count > 1){
                    value = parameterParts[1] as String;
                }
                
                self.addQueryStringParameter(key, value: value);
            }
        }
    }
    
    public func addQueryStringParameter(name: String, value: String) {
        
        var dicc = NSMutableDictionary(objectsAndKeys: value, name);
        dicc.addEntriesFromDictionary(self.queryStringParameters);
        self.queryStringParameters = dicc;
    }
    
    public func appendPathComponent(value: String) {
        
        var a = NSMutableArray(objects: value);
        a.addObjectsFromArray(self.pathComponents);
        self.pathComponents = a;
    }
    
    public func toString() -> String {
        
        var queryString = self.baseUrl + "/";
        
        for value in self.pathComponents{
            
            if(value.hasPrefix("('") && value.hasPrefix("')")){
                queryString = self.removeTrailingSlash(queryString);
            }
            
            queryString += value as String;
        }
        
        if(self.queryStringParameters.allKeys.count > 0){
            queryString += "?";
        }
        
        for key in self.queryStringParameters.allKeys{
            queryString += (key as NSString).urlencode();
            queryString += "=";
            queryString += (self.queryStringParameters.objectForKey(key) as String).urlencode();
            queryString += "&";
        }
        
        if(queryString.hasSuffix("&")){
            var theString : NSString =  queryString as NSString;
            queryString = theString.substringWithRange(NSMakeRange(0, theString.length - 1))
        }
        
        return queryString;
    }
}