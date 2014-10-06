/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
@protocol Executable

-(NSURLSessionDataTask*)execute :(void (^)(id entity, NSURLResponse *response, NSError *error))callback;

@end

@interface Executable<Executable>
@end
