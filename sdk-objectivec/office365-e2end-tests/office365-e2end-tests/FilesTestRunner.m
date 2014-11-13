//
//  FilesTestRunner.m
//  office365-e2end-tests
//
//  Created by Anahi Hojnadel on 11/13/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "FilesTestRunner.h"

@implementation FilesTestRunner
-(id)initWithClient : (MSSharePointClient*)client{
    self.Client = client;
    return self;
}

-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (id test))result{
    
    //General
    if([testName isEqualToString: @"Test1"]) return [self Test1:result];
    
    return nil;
}

-(NSMutableArray*)getTests{
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self :@"TestGet1" :@"Test 1" ]];
    
    return array;
}

// ****** General Tests *******

-(NSURLSessionDataTask*)Test1:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self.Client getfiles] read:^(NSArray<MSSharePointItem> *items, NSError *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        result(test);
    }];
    
    return task;
}
@end
