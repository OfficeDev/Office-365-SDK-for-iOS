/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation
import office365_odata_base

public class MSSharePointFileOperations : MSSharePointItemOperations{

    public override init(urlComponent: String, parent: MSSharePointODataExecutable) {
        super.init(urlComponent: urlComponent, parent: parent);
    }
    
    public func copy(destFolderId : String, destFolderPath : String, newName : String, callback : ((file : MSSharePointFile?, error : NSError?) -> Void!)) -> NSURLSessionDataTask{
        
        var url = self.getResolver().createODataURL();
        
        var parameters = NSDictionary(objects: [destFolderId, destFolderPath, newName], forKeys: ["destFolderId","destFolderPath","newName"]);
        
        var payload = MSSharePointBaseODataContainerHelper.generatePayload(parameters, resolver: self.getResolver()).dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        
        url.appendPathComponent("copy");
        
        var task = super.oDataExecute(url, content: payload, verb: MSHttpVerb.POST, callback: { (response : MSResponse?, e : NSError?) -> Void! in
            callback(file: self.getResult(response, error: e) as MSSharePointFile?, error: e);
        });
        
        return task;
    }
}