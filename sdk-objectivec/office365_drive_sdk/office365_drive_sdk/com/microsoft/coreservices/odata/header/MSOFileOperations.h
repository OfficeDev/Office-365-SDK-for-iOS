/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataOperations.h"
#import "MSOFile.h"


/**
* The header for type MSOFileOperations.
*/

@interface MSOFileOperations : MSOODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)copy : (NSString *) destFolderId : (NSString *) destFolderPath : (NSString *) newName : (void (^)(MSOFile *file, NSError *error))callback;			
-(NSURLSessionDataTask*)uploadContent : (MSOStream *) contentStream : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)content : (void (^)(MSOStream *stream, NSError *error))callback;			

@end