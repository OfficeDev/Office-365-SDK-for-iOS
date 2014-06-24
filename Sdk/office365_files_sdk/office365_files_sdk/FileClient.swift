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

    let apiUrl = "/_api/"
    
    func getFiles(callback : ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask {
        
        return self.getFiles(nil, callback);
    }
    
    func getFiles(folder : NSString?, callback : ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask {
        
        var connection = HttpConnection();
        connection.initializeWith(self.Url + self.apiUrl + "files" ,credentials: self.Credential);
        
        return connection.execute(Constants.Method_Get, callback : callback);
    }
    
    override func parseData(data : NSData) -> NSMutableArray{
        var array = NSMutableArray();
        var err: NSError;
        
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary;
        
        var jsonArray : NSArray = (jsonResult.valueForKey("d") as NSDictionary).valueForKey("results") as NSArray;
        
        for value : AnyObject in jsonArray{
            var file = FileEntity();
            
            file.createFromJson(value as NSDictionary)
            
            array.addObject(file);
        }
        
        return array;
    }
}