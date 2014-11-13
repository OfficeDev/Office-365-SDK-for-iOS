/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation
import office365_odata_base

public class MSSharePointBaseODataContainerHelper {
    
    private var resolver : MSDependencyResolver;
    private var urlComponent : String;
    
    init(url : String, dependencyResolver : MSDependencyResolver){
        self.urlComponent = url;
        self.resolver = dependencyResolver;
    }
    
    public func oDataExecute(path : MSODataURL, content : NSData?, verb : MSHttpVerb,productName : NSString, callback :
        ((response : MSResponse, error : NSError?) -> Void?)) -> NSURLSessionDataTask{
            
            path.setBaseUrl(self.urlComponent);
            var httpTransport = self.resolver.getHttpTransport();
            var request = httpTransport.createRequest();
            
            request.setVerb(verb);
            request.setUrl(path.toString());
            request.setContent(content);
            request.addHeader("Content-Type", value : "application/json");
            request.addHeader("User-Agent", value : self.resolver.getPlatformUserAgent(productName));
            request.addHeader("X-ClientService-ClientTag", value :self.resolver.getPlatformUserAgent(productName));
            
            if(verb == MSHttpVerb.PATCH || verb == MSHttpVerb.DELETE){
                request.addHeader("If-Match", value: "*");
            }
            
            self.resolver.getCredentialsFactory().getCredentials().prepareRequest(request);
            
            return httpTransport.execute(request, callback: { (r : MSResponse?, e : NSError?) -> Void? in
            
                callback(response: r!, error: e);
                
            });
    }

    public class func generatePayload(parameters : NSDictionary, resolver : MSDependencyResolver) -> String{
    
        var result : NSMutableString = "{";
        
        for key in parameters.allKeys{
            
                var object: AnyObject? = parameters.objectForKey(key)
                var parsed = resolver.getJsonSerializer().serialize(object!, name: key as String);
                result.appendFormat("\"%@\":%@,", key as String, parsed);
        }
        
        var value = result.substringWithRange(NSMakeRange(0, result.length - 1)) + "}";
        return value;
    }
    
    public class func addCustomParametersToODataURL(url : MSODataURL, parameters : NSDictionary, resolver : MSDependencyResolver){
    
        for key in parameters.allKeys{
        
            var value = parameters.objectForKey(key) as String;
            url.addQueryStringParameter(value, value: key as String);
        }
    }
    
    public class func getFunctionParameters(parameters : NSDictionary) -> String{
        
        var theString = NSMutableString();
        
        for key in parameters.allKeys{
            if(theString.length > 0){
                theString.appendString(",");
            }
            
            theString.appendString(key as String);
            theString.appendString("=");
            var odataValue = self.toODataURLValue(parameters.objectForKey(key)!);
            theString.appendString(odataValue);
        }
        
        return theString;
    }
    
    public class func toODataURLValue(o : AnyObject) -> String{
    
        var result = NSMutableString();
        result.appendFormat("'%@'", 0);
        
        return result;
        /*if (o instanceof String) {
        return "'" + o + "'";
        }
        
        if (o instanceof Calendar) {
        return "'" + CalendarSerializer.serialize((Calendar)o) + "'";
        }
        
        return o.toString();*/
    }
    
    public func getResolver() -> MSDependencyResolver{
    
        return self.resolver;
    }
}