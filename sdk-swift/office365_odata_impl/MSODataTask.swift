//
//  MSODataTask.swift
//  office365_odata_base
//
//  Created by Gustavo on 11/12/14.
//  Copyright (c) 2014 becoders. All rights reserved.
//

import Foundation

public class MSODataTask : NSURLSessionDataTask{


    public func get(callback : ((result : NSURLResponse?, error : NSError?)->Void!)){
    
        while(self.state == NSURLSessionTaskState.Running){
            
        }
        
        return callback(result: self.response, error: self.error);
    }
}