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
        
        var url = self.Url + self.apiUrl + "files";
        var connection = HttpConnection(credentials: self.Credential, url : url);
        
        return connection.execute(Constants.Method_Get, callback : callback);
    }
    
    func createEmptyFile(name : NSString,folder : NSString?,
        callback : ((NSData!, NSURLResponse!, NSError!) -> Void)!)-> NSURLSessionDataTask {
            
            var url = self.Url + self.apiUrl + "files";
            var body = NSString(format: "{'__metadata':{'type':'MS.FileServices.File'},Name:'%@'}", name);
            var connection = HttpConnection(credentials: self.Credential, url : url, body: body);
            return connection.execute(Constants.Method_Post, callback : callback);
    }
    
    
    func createFile(name: NSString, overwrite : Bool ,body : NSData,folder : NSString?,
        callback : ((NSData!, NSURLResponse!, NSError!) -> Void)!)-> NSURLSessionDataTask {
            
            var url = self.Url + self.apiUrl + NSString(format: "files/Add(name='%@',overwrite='%@')", name, overwrite ? "true" : "false");
            var connection = HttpConnection(credentials: self.Credential, url : url, bodyArray: body);
            return connection.execute(Constants.Method_Post, callback : callback);
    }
    
    
    func createFolder(name : NSString, parentFolder : NSString?, callback : ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask{
        
        var url = self.Url + self.apiUrl + "files";
        var body = NSString(format: "{'__metadata':{'type':'MS.FileServices.Folder'},Name:'%@'}", name);
        
        var connection = HttpConnection(credentials: self.Credential, url: url, body: body);
        return connection.execute(Constants.Method_Post, callback: callback);
    }
    
    func download(name: NSString, delegate: NSURLSessionDelegate) -> NSURLSessionDownloadTask {
        
        var url = self.Url + self.apiUrl + NSString(format: "files('%@')/download", name);
        var connection = ExtendedHttpConnection(credentials: self.Credential, url : url);
        
        return connection.download(Constants.Method_Get, delegate: delegate);
    }
    
    func delete(name : NSString, callback : ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask{
        
        var url = self.Url + self.apiUrl + NSString(format:"files('%@')", name);
        
        var connection = HttpConnection(credentials: self.Credential, url: url);
        return connection.execute(Constants.Method_Delete, callback: callback);
    }
    
    func copy(name : NSString, destinationFolder : NSString, callback : ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask{
        
        var url = self.Url + self.apiUrl + NSString(format:"files('%@')/CopyTo('%@',overwrite=true)", name,destinationFolder);
        
        var connection = HttpConnection(credentials: self.Credential, url: url);
        return connection.execute(Constants.Method_Post, callback: callback);
    }
    
    func move(name : NSString, destinationFolder : NSString, callback : ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask{
        
        var url = self.Url + self.apiUrl + NSString(format:"files('%@')/MoveTo('%@',overwrite=true)", name,destinationFolder);
        
        var connection = HttpConnection(credentials: self.Credential, url: url);
        return connection.execute(Constants.Method_Post, callback: callback);
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