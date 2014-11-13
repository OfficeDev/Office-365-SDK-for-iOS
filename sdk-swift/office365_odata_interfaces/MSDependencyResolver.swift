/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public protocol MSDependencyResolver{
    
    func getHttpTransport() -> MSHttpTransport
    func getLogger() -> MSLogger
    func getJsonSerializer() -> MSJsonSerializer
    func getCredentialsFactory() -> MSCredentialsFactory
    func createODataURL() -> MSODataURL
    func getPlatformUserAgent(productName : String) -> String
}