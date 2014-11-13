/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public class MSHttpConnection : MSHttpTransport{

    required public init(){
    
    }
    
    public func execute(request: MSRequest, callback: ((response: MSResponse?, error: NSError?) -> Void?)) -> NSURLSessionDataTask {
        
        var r = (request as MSRequestImpl).getMutableRequest();
        
        var session = NSURLSession.sharedSession();
        var task = session.dataTaskWithRequest(r, completionHandler: { ( data : NSData!, response : NSURLResponse!, e : NSError! ) -> Void in
            
            var statusCode = (response as NSHTTPURLResponse).statusCode;
            
            if (statusCode < 200 || statusCode > 299){
            
                if(e == nil){
                    
                    var msj: AnyObject? = NSJSONSerialization.JSONObjectWithData(data,
                        options: NSJSONReadingOptions.MutableContainers, error: nil);
                    
                    var error = NSError(domain: "Error in the Request", code: statusCode, userInfo: msj as NSDictionary);
                    callback(response: MSResponseImpl(data: nil, status: statusCode), error: e);
                }
            }
            else{
            
                var responseImpl = MSResponseImpl(data: data,status: statusCode);
                callback(response: responseImpl, error: e);
            }
            
        });
        
        return task;
    }
    
    public func createRequest() -> MSRequest {
        return MSRequestImpl();
    }
}