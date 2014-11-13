//
//  MSSharePointItemCollectionOperations.swift
//  office365_files_sdk
//
//  Created by Gustavo on 11/7/14.
//  Copyright (c) 2014 MsOpentech. All rights reserved.
//

import Foundation
import office365_odata_base

public class MSSharePointItemCollectionOperations : MSSharePointODataOperations{

    public func getByPath(path : String, callback : ((item : MSSharePointItem?, error : NSError?)-> Void!)) -> NSURLSessionDataTask{
    
        var url = self.getResolver().createODataURL();
        var params = NSDictionary(object: path, forKey: "path");
        
        var funcParams = MSSharePointBaseODataContainerHelper.getFunctionParameters(params);
        url.appendPathComponent(String(format: "getByPath(%@)", funcParams));
        
        var task = super.oDataExecute(url, content: nil, verb: MSHttpVerb.POST, callback: { (response : MSResponse?, e : NSError?) -> Void! in
            callback(item: self.getResult(response, error: e) as MSSharePointItem?, error: e);
        })
        
        return task;
    }
}