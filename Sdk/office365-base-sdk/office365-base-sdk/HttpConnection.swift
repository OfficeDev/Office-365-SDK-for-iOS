//
//  HttpConnection.swift
//  office365-base-sdk
//
//  Created by Lagash on 6/13/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

import Foundation

class HttpConnection : NSObject{
    
    var request : NSMutableURLRequest = NSMutableURLRequest();

    var credentials : Credentials = Credentials();
    
    init(){ }
    
    func initializeWith(url : String, credentials : Credentials){
        
        self.credentials = credentials;
        
        request = NSMutableURLRequest(URL : NSURL(string : url));
        
        //request.HTTPBody = (data as NSString).dataUsingEncoding(NSUTF8StringEncoding);
    
        request.addValue("application/json;odata=verbose", forHTTPHeaderField: "Accept");
        request.addValue("100-continue", forHTTPHeaderField: "Expect");
        request.addValue("application/json;odata.metadata=full", forHTTPHeaderField: "Content-Type");
      	request.addValue("SDK-Swift", forHTTPHeaderField:"X-ClientService-ClientTag" );
        credentials.prepareRequest(request);
    }
    
    func execute(method : String, client : BaseClient, callback : ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask{
        var session =  NSURLSession.sharedSession();
        var task = session.dataTaskWithRequest(request,
            completionHandler: callback);
        
        return task;
    }
}