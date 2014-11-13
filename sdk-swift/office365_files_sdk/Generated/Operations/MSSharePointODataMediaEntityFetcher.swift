/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation
import office365_odata_base

public class MSSharePointODataMediaEntityFetcher<T : NSObject, U : MSSharePointODataOperations> : MSSharePointODataEntityFetcher<T,U>{
    
    public override init(urlComponent : String, parent : MSSharePointODataExecutable){
        super.init(urlComponent: urlComponent, parent: parent);
        self.operations = U(urlComponent: urlComponent, parent: parent);
    }
    
    public func getContent(callback : ((content : NSData?, error : NSError?)-> Void!)) -> NSURLSessionDataTask{
        
        var url = self.getResolver().createODataURL();
        url.appendPathComponent("$value");
        
        return self.oDataExecute(self.getResolver().createODataURL(), content: nil, verb: MSHttpVerb.GET,
            callback: { (response : MSResponse?, e : NSError?) -> Void! in

                callback(content: response?.getData(), error: e);
        });
    }
    
    public func putContent(content : NSData, callback : ((result : NSInteger?, error : NSError!)-> Void!)) -> NSURLSessionDataTask{
        
        var url = self.getResolver().createODataURL();
        url.appendPathComponent("$value");

        return self.oDataExecute(self.getResolver().createODataURL(), content: content, verb: MSHttpVerb.PUT,
            callback: { (response : MSResponse?, e : NSError?) -> Void! in
                
                callback(result: response?.getStatus(),error: e);
        });
    }
}