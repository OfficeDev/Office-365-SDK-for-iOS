//
//  FileClient.swift
//  office365-files-sdk
//
//  Created by Lagash on 6/23/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

import Foundation
import office365_base_sdk
class FileClient : BaseClient{
    
    let credentials : Credentials;
    let url :NSString;
    let apiUrl = "/_api/"
    init(url : NSString ,credentials : Credentials){
        
        self.credentials = credentials;
        self.url = url;
        
  
    }
    
    func getFiles(folder : NSString, callback : ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask {
        
        var connection = HttpConnection();
        connection.initializeWith(self.url + self.apiUrl + "files" ,credentials: self.credentials);
        
        return connection.execute(Constants.Method_Get, callback : callback);
    }
}