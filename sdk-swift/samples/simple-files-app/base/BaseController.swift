/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation
import office365_odata_base
import office365_files_sdk

class BaseController{

    class func getClient(resultCallback : (client : MSSharePointClient) -> Void!){
    
        var loginController = LogInController();
    
        loginController.getToken("https://teeudev1-my.sharepoint.com", clearCache: true, callback :{ (token : String) -> Void! in
            
            resultCallback(client: self.getClientWith(token));
        });
    }

    class func getSpinner(view : UIView) -> UIActivityIndicatorView{
    
        var spinner = UIActivityIndicatorView(frame: CGRectMake(135,140, 50, 50));
        spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray;
        
        view.addSubview(spinner);
        spinner.hidesWhenStopped = true;
        spinner.startAnimating()

        return spinner;
    }
    
    private class func getClientWith(token : String) -> MSSharePointClient{
        var credentials = MSOAuthCredentials(token: token);
        
        var credentialsFactory = MSCredentialsFactoryImpl(credentials: credentials);
        var resolver = MSDefaultDependencyResolver(credentialsFactory: credentialsFactory);
        var sharePointClient = MSSharePointClient(urlComponent: "https://teeudev1-my.sharepoint.com/_api/v1.0/me", dependencyResolver: resolver);
        
        return sharePointClient;
    }
}