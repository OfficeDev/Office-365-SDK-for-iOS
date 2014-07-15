//
//  ListClient.swift
//  office365_list_sdk
//
//  Created by Gustavo on 7/15/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

import Foundation
import office365_base_sdk

class ListClient : BaseClient{
    
    let apiUrl = "/_api/"
    
    func getLists(callback : ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask {
        
        var url = self.Url + self.apiUrl + "lists";
        var connection = HttpConnection(credentials: self.Credential, url : url);
        
        return connection.execute(Constants.Method_Get, callback : callback);
    }
    
    func getList(name : NSString, callback : ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask {
        
        var url = self.Url + self.apiUrl + NSString(format: "lists/GetByTitle('%@')", name);
        var connection = HttpConnection(credentials: self.Credential, url : url);
        
        return connection.execute(Constants.Method_Get, callback : callback);
    }
    
    override func parseData(data : NSData) -> NSMutableArray{
        var array = NSMutableArray();
        var err: NSError;
        
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary;
        
        var jsonArray : NSArray = (jsonResult.valueForKey("d") as NSDictionary).valueForKey("results") as NSArray;
        
        for value : AnyObject in jsonArray{
            var sharepointList = ListEntity();
            
            sharepointList.createFromJson(value as NSDictionary)
            
            array.addObject(sharepointList);
        }
        
        return array;
    }
}