//
//  OAuthentication.swift
//  office365-base-sdk
//
//  Created by Lagash on 6/13/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

import Foundation

class OAuthentication : Credentials{

    var token : String;
    
    init(){
        self.token = "";
    }

    override func prepareRequest(request: NSMutableURLRequest) {
        request.addValue("Bearer " + self.token, forHTTPHeaderField: "Authorization");
    }
    
    func setToken(token :String){
        self.token = token;
    }
}