/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@implementation EventOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;

-(NSURLSessionDataTask*)accept : (NSString *) Comment : :(void (^)(int d, NSError *error))callback;			

-(NSURLSessionDataTask*)decline : (NSString *) Comment : :(void (^)(int d, NSError *error))callback;			

-(NSURLSessionDataTask*)tentativelyAccept : (NSString *) Comment : :(void (^)(int d, NSError *error))callback;			

-(NSURLSessionDataTask*)instances : (NSDate *) StartDate : (NSDate *) EndDate : :(void (^)(Event d, NSError *error))callback;			
@end