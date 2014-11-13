/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public class MSDefaultDependencyResolver : MSDependencyResolver{

    private let credentialsFactory : MSCredentialsFactory;
    
    public init(credentialsFactory : MSCredentialsFactory){
        self.credentialsFactory = credentialsFactory;
    }
    
    public func getHttpTransport() -> MSHttpTransport{
        return MSHttpConnection();
    }
    
    public func getLogger() -> MSLogger{
        return MSLoggerImpl();
    }
    
    public func getJsonSerializer() -> MSJsonSerializer{
    
        return MSJsonSerializerImpl();
    }
    
    public func getCredentialsFactory() -> MSCredentialsFactory{
        return self.credentialsFactory;
    }
    
    public func createODataURL() -> MSODataURL{
        return MSODataURLImpl();
    }
    
    public func getPlatformUserAgent(productName : String) -> String{
        
        var cpu = String();
        
        /*cpu_type_t type;
        size_t size = sizeof(type);
        sysctlbyname("hw.cputype", &type, &size, NULL, 0);
        
        if (type == CPU_TYPE_X86){
            [cpu appendString:@"x86 "];
            
        }else if (type == CPU_TYPE_ARM){
            [cpu appendString:@"ARM"];
        }
        else if(type == CPU_TYPE_X86_64){
            [cpu appendString:@"X86_64"];
        }
        else{
            [cpu appendString:@"Other"];
        }
        
        return [[NSString alloc] initWithFormat:@"%@/1.0 (lang=%@; os=%@; os_version=%@; arch=%@; version=%d)", productName, @"Objective-C", [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion], cpu ,6];*/
        return NSString(format: "%@/1.0 (lang=%@; os=%@; os_version=%@; arch=%@; version=%d)", productName, "Swift", "","",cpu,6);
    }
}