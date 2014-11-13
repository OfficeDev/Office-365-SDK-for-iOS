/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

class LogInController{

    private var token = String();
    private var redirectUriString : String;
    private var authority : String;
    private var clientId : String;
    private var authContext : ADAuthenticationContext;
    
    init(){
        
        var userDefaults = NSUserDefaults.standardUserDefaults();
        
        redirectUriString = userDefaults.objectForKey("RedirectUrl") as String;
        authority = userDefaults.objectForKey("AuthorityUrl") as String;
        clientId = userDefaults.objectForKey("CliendId") as String;
        authContext = ADAuthenticationContext(authority: authority, error: nil);
    }
    
    func getToken(resourceId : String, clearCache : Bool, callback : ((token : String) -> Void!)){
        
        var redirectUri = NSURL(string:redirectUriString);
        
        authContext.acquireTokenWithResource(resourceId, clientId: self.clientId, redirectUri: redirectUri) { (result : ADAuthenticationResult!) -> Void in
            
            if(result.status.value == 0){
                var userDefaults = NSUserDefaults.standardUserDefaults();
                userDefaults.setObject(result.tokenCacheStoreItem.userInformation.userId, forKey: "LogInUser");
                userDefaults.synchronize();
                callback(token: result.accessToken!);
            }
            else{
                
            }
            
        }
    }
}