/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation
import office365_odata_base

public class MSSharePointBaseODataContainer : MSSharePointODataExecutable{

    private var resolver : MSDependencyResolver;
    
    public init(urlComponent: String, dependencyResolver: MSDependencyResolver) {
        self.resolver = dependencyResolver;
        super.init(urlComponent: urlComponent, parent: nil);
    }
    
    override func getResolver() -> MSDependencyResolver {
        return self.resolver;
    }
    
    override func oDataExecute(path: MSODataURL, content: NSData?, verb: MSHttpVerb, callback: ((MSResponse, NSError?) -> Void!)) -> NSURLSessionDataTask {
        
        return MSSharePointBaseODataContainerHelper(url: self.UrlComponent, dependencyResolver: self.getResolver()).oDataExecute(path, content: content, verb: verb, productName: "GetFullPrefix()-sdk/MSSharePointBaseODataContainer", callback: callback);
    }
}