/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation
import office365_odata_base

public class MSSharePointODataEntityFetcher<T : NSObject, U : MSSharePointODataOperations>
                                                 : MSSharePointODataExecutable{
    
    var operations : U;
    
    public init(urlComponent : String, parent : MSSharePointODataExecutable){
        self.operations = U(urlComponent: urlComponent, parent: parent);
        super.init(urlComponent: urlComponent, parent: parent);
    }
    
    public func read(callback : ((entity: T?, error: NSError) -> Void!)) -> NSURLSessionDataTask {
        
        var task = self.oDataExecute(self.getResolver().createODataURL(), content: nil, verb: MSHttpVerb.GET, callback : { (r : MSResponse, e : NSError?) -> Void! in
            
            callback(entity: self.getResult(r, error : e),error: e!);
        });
        
        return task;
    }
    
    public func update(entity : T,callback : ((entity: T?, error: NSError) -> Void!)) -> NSURLSessionDataTask {
        
        var payload = self.getResolver().getJsonSerializer().serialize(entity);
        var task = self.oDataExecute(getResolver().createODataURL(), content: payload.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false), verb: MSHttpVerb.PATCH, callback : { (r : MSResponse, e : NSError?) -> Void! in
            
            callback(entity: self.getResult(r, error : e) as T?,error: e!);
        });
        
        return task;
    }
    
    public func delele(callback : ((status : NSInteger, error: NSError) -> Void!)) -> NSURLSessionDataTask {
        
        var task = self.oDataExecute(getResolver().createODataURL(), content: nil, verb: MSHttpVerb.DELETE, callback : { (r : MSResponse, e : NSError?) -> Void! in
            
            callback(status: r.getStatus(),error: e!);
        });
        
        return task;
    }
    
    public func getOperations() -> U {
    
        return self.operations;
    }
    
    override func oDataExecute (path : MSODataURL, content : NSData?, verb : MSHttpVerb, callback : ((MSResponse, NSError?) -> Void!)) -> NSURLSessionDataTask{
        
        path.appendPathComponent(self.UrlComponent);
        MSSharePointBaseODataContainerHelper.addCustomParametersToODataURL(path, parameters: self.getCustomParameters(), resolver: self.Parent!.getResolver())
        
        return self.Parent!.oDataExecute(path, content: content, verb: verb, callback: { (r, e) -> Void! in
            
            callback(r,e);
        });
    }
}