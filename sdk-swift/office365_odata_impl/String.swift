/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

extension NSString{
    
    func urlencode() -> String{
        
        let exceptions : NSString = "!$&'()*+,;=:@";

        var output = NSMutableString();
        var source = self.UTF8String;
    
        for thisChar in self as String{
            
            var s : String = "";
            s.append(thisChar);
            var range = exceptions.containsString(s);
            
            if(thisChar == " "){
                output.appendString("%20");
            }else if((thisChar == "." || thisChar == "-" || thisChar == "_" || thisChar == "~") ||
                    (thisChar >= "a" && thisChar <= "z") ||
                    (thisChar >= "A" && thisChar <= "Z") ||
                    (thisChar >= "0" && thisChar <= "9") || range){
                output.appendFormat("%c", s)
            }else{
                output.appendFormat("%%%02X", s);
            }
        }
        
        return output;
    }
}