/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public class MSSharePointItemFetcher<MSSharePointItem,MSSharePointItemOperations>  : MSSharePointODataEntityFetcher<NSObject, MSSharePointODataOperations>{
    
    public func asFile() -> MSSharePointFileFetcher<MSSharePointFile,MSSharePointFileOperations>{
        return MSSharePointFileFetcher(urlComponent: self.UrlComponent, parent: self.Parent!); //as MSSharePointFileFetcher<MSSharePointFile,MSSharePointFileOperations>;
    }
    
    public func asFolder() -> MSSharePointFolderFetcher<MSSharePointFolder,MSSharePointODataOperations>{
        return MSSharePointFolderFetcher(urlComponent: self.UrlComponent, parent: self.Parent!)// as MSSharePointFolderFetcher<MSSharePointFolder,MSSharePointODataOperations>;
    }
}