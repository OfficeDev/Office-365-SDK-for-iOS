/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFile.h"
#import "MSOItemOperations.h"

/**
* The header for type MSOFileOperations.
*/


@interface MSOFileOperations : MSOItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)copy : (NSString *) destFolderId : (NSString *) destFolderPath : (NSString *) newName : (void (^)(MSOFile *file, NSError *error))callback;			
-(NSURLSessionDataTask*)uploadContent : (NSStream *) contentStream : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)content : (void (^)(NSStream *stream, NSError *error))callback;			

@end