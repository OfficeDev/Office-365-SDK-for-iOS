//
//  ExtendedHttpConnection.swift
//  office365_files_sdk
//
//  Created by Gustavo on 7/4/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

import Foundation
import office365_base_sdk

class ExtendedHttpConnection : HttpConnection{

    func download(method : String, delegate : NSURLSessionDelegate) -> NSURLSessionDownloadTask{
        
        self.request.HTTPMethod = method;
        
        var session =  NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate: delegate,
            delegateQueue: NSOperationQueue.mainQueue());
        
        var task = session.downloadTaskWithRequest(self.request);

        return task;
    }
}