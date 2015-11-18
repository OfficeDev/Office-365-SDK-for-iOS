/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "OneNoteTestRunner.h"
#import <core/MSOCalendarSerializer.h>
@interface OneNoteTestRunner()

@property (nonatomic, weak) OneNoteTestRunner *weakSelf;
@end
@implementation OneNoteTestRunner

- (id)initWithClient:(MSOneNoteApiClient*)client {
    
    if (self = [super init]) {

        self.client = client;
        _weakSelf = self;
    }
    
    return self;
}

- (void)run:(NSString *)testName completionHandler:(void(^)(id test))result {
    
    if([testName isEqualToString: @"TestGetNotebooks"]) return [self testGetNotebooks:result];
    if([testName isEqualToString: @"TestGetNotebooksById"]) return [self testGetNotebooksById:result];
    if([testName isEqualToString: @"TestCreateNotebooks"]) return [self testCreateNotebooks:result];
    if([testName isEqualToString: @"TestGetSections"]) return [self testGetSections:result];
    if([testName isEqualToString: @"TestCreateSections"]) return [self testCreateSections:result];
    if([testName isEqualToString: @"TestGetSectionsById"]) return [self testGetSectionsById:result];
    if([testName isEqualToString: @"TestGetSectionGroups"]) return [self testGetSectionGroups:result];
    if([testName isEqualToString: @"TestGetPages"]) return [self testGetPages:result];
    if([testName isEqualToString: @"TestSearchPage"]) return [self testSearchPage:result];
    if([testName isEqualToString: @"TestGetPageContent"]) return [self testGetPageContent:result];
    if([testName isEqualToString: @"TestCreateSimplePage"]) return [self testCreateSimplePage:result];
    if([testName isEqualToString: @"TestCreatePageWithEmbeddedWebImage"]) return [self testCreatePageWithEmbeddedWebImage:result];
    if([testName isEqualToString: @"TestCreatePageWithImage"]) return [self testCreatePageWithImage:result];
    if([testName isEqualToString: @"TestCreatePageWithNoteTags"]) return [self testCreatePageWithNoteTags:result];
    if([testName isEqualToString: @"TestCreatePageWithAttachment"]) return [self testCreatePageWithAttachment:result];
}

- (NSMutableArray *)getTests {
    
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetNotebooks" displayName:@"Get notebooks" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetNotebooksById" displayName:@"Get notebooks by id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateNotebooks" displayName:@"Create notebooks" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetSections" displayName:@"Get sections" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateSections" displayName:@"Create sections" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetSectionsById" displayName:@"Get sections by id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetSectionGroups" displayName:@"Get sections groups" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetPages" displayName:@"Get pages" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestSearchPage" displayName:@"Search pages" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetPageContent" displayName:@"Get page content" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateSimplePage" displayName:@"Create simple page" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreatePageWithEmbeddedWebImage" displayName:@"Create page with embedded web img"]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreatePageWithImage" displayName:@"Create page with image" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreatePageWithNoteTags" displayName:@"Create page with note tags" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreatePageWithAttachment" displayName:@"Create page with attachment" ]];
    
    return array;
}

#pragma mark TestNoteBooks

- (void)testCreateNotebooks:(void(^)(Test *))result {
    
    return [[self.client.me.notes.notebooks filter:@"name eq 'Test notebook iOS'"] readWithCallback:^(NSArray *notebooks, MSOrcError *error) {
        
        MSOneNoteApiNotebook *newNotebook = [[MSOneNoteApiNotebook alloc] init];
        newNotebook.name = @"Test notebook iOS";
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
        if ([notebooks count] == 0) {
            
            [self.client.me.notes.notebooks add:newNotebook callback:^(MSOneNoteApiNotebook *notebook, MSOrcError *e) {
                BOOL passed = false;
                NSString* message = @"";
                
                if(error == nil && notebook != nil)
                {
                    passed = true;
                    message = @"Ok - ";
                }else{
                    message = @"Not - ";
                    if(error!= nil)
                        message = [message stringByAppendingString: [error localizedDescription]];
                }
                
                test.passed = passed;
                [test.executionMessages addObject:message];
                result(test);
            }];
        }
        else {
            
            test.passed = true;
            [test.executionMessages addObject:@"Ok - Notebook already exists"];
            result(test);
        }
    }];
}

- (void)testGetNotebooks:(void(^)(Test *))result {
    
    return [self.client.me.notes.notebooks readWithCallback:^(NSArray *notebooks, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        
        if (error == nil && notebooks != nil) {
            
            passed = true;
            message = @"Ok - ";
        }
        else {
            
            message = @"Not - ";
            
            if (error != nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

- (void)testGetNotebooksById:(void(^)(Test *))result {
    
    return [self.client.me.notes.notebooks readWithCallback:^(NSArray *notebooks, MSOrcError *error) {
        
        Test *test = [Test alloc];
        test.executionMessages = [NSMutableArray array];
        
        if (error == nil && notebooks != nil && [notebooks count] > 0) {
            
            MSOneNoteApiNotebook *singleNotebook = [notebooks objectAtIndex:0];
            
            [[self.client.me.notes.notebooks getById:singleNotebook._id] readWithCallback:^(MSOneNoteApiNotebook *notebook, MSOrcError *error2) {
                
                BOOL passed = false;
                NSString* message = @"";
                if(error2 == nil && notebook != nil)
                {
                    passed = true;
                    message = @"Ok - ";
                }else{
                    message = @"Not - ";
                    if(error!= nil)
                        message = [message stringByAppendingString: [error localizedDescription]];
                }
                
                test.passed = passed;
                [test.executionMessages addObject:message];
                result(test);
                
            }];
        }
        else {
            
            NSString *message = @"Not - Error getting notebooks";
            
            if (error!= nil) {
                
                message = [message stringByAppendingString: [error localizedDescription]];
            }
            
            test.passed = false;
            [test.executionMessages addObject:message];
            result(test);
        }
    }];
}

#pragma mark TestSections

- (void)testGetSections:(void (^) (Test*))result{
    
    return [self.client.me.notes.sections readWithCallback:^(NSArray *sections, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        test.executionMessages = [NSMutableArray array];
        
        NSString* message = @"";
        
        if (error == nil && sections != nil) {
            
            passed = true;
            message = @"Ok - ";
        }
        else {
            
            message = @"Not - ";
            
            if (error!= nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

- (void)testCreateSections:(void(^)(Test *))result {
    
    return [[[self.client.me.notes.notebooks filter:@"name eq 'Test notebook iOS'"] top:1] readWithCallback:^(NSArray *notebooks, MSOrcError *error) {
        
        Test *test = [Test alloc];
        test.executionMessages = [NSMutableArray array];
        
        if (notebooks > 0) {
            
            MSOneNoteApiSection *newSection = [[MSOneNoteApiSection alloc]init];
            newSection.name = [@"Section-" stringByAppendingString:[[NSUUID UUID] UUIDString]];
            
            [[self.client.me.notes.notebooks getById:[[notebooks objectAtIndex:0] _id]].sections add:newSection callback:^(MSOneNoteApiSection *addedSection, MSOrcError *e) {
                
                BOOL passed = false;
                NSString* message = @"";
                
                if (error == nil && addedSection != nil) {
                    
                    passed = true;
                    message = @"Ok - ";
                }
                else {
                    
                    message = @"Not - ";
                    
                    if (error!= nil)
                        message = [message stringByAppendingString: [error localizedDescription]];
                }
                
                test.passed = passed;
                [test.executionMessages addObject:message];
                
                result(test);
            }];
        }
        else {
            
            test.passed = false;
            [test.executionMessages addObject:@"Not - Notebook does not exist"];
            result(test);
        }
    }];
}

- (void)testGetSectionsById:(void(^)(Test *))result {
    
    return [[self.client.me.notes.sections top:1] readWithCallback:^(NSArray *sections, MSOrcError *error) {
        
        Test *test = [Test alloc];
        test.executionMessages = [NSMutableArray array];
        
        if ([sections count] > 0) {
            
            MSOneNoteApiSection *s =[sections objectAtIndex:0];
            
            [[self.client.me.notes.sections getById: s._id] readWithCallback:^(MSOneNoteApiSection *section, MSOrcError *error) {
                
                BOOL passed = false;
                NSString* message = @"";
                
                if (error == nil && section != nil) {
                    
                    passed = true;
                    message = @"Ok - ";
                }
                else {
                    
                    message = @"Not - ";
                    
                    if (error!= nil)
                        message = [message stringByAppendingString: [error localizedDescription]];
                }
                
                test.passed = passed;
                [test.executionMessages addObject:message];
                result(test);
            }];
        }
        else {
            
            test.passed = false;
            [test.executionMessages addObject:@"Not - No existing sections"];
            result(test);
        }
    }];
}

- (void)testGetSectionGroups:(void(^)(Test *))result {
    
    return [self.client.me.notes.sectionGroups readWithCallback:^(NSArray *sectionGroups, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        
        if (error == nil && sectionGroups != nil) {
            
            passed = true;
            message = @"Ok - ";
        }
        else {
            
            message = @"Not - ";
            
            if (error!= nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

#pragma mark TestPages

- (void)testGetPages:(void (^) (Test*))result{
    
    return [[self.client.me.notes.pages top:1] readWithCallback:^(NSArray *pages, MSOrcError *error) {
        
        BOOL passed = false;
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString *message = @"";
        
        if (error == nil && pages != nil) {
            
            passed = true;
            message = @"Ok - ";
        }
        else {
            
            message = @"Not - ";
            
            if (error!= nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

- (void)testGetPagesFromSection:(void (^) (Test*))result{
    
    return [self.client.me.notes.sections readWithCallback:^(NSArray *sections, MSOrcError *error) {
        
        Test *test = [Test alloc];
        test.executionMessages = [NSMutableArray array];
        /*
         if(error == nil && sections != nil && [sections count] >0)
         {
         MSOneNoteApiSection *singleSection= [sections objectAtIndex:0];
         [[[[self.Client getsections] getById:singleSection.id]
         BOOL passed = false;
         NSString* message = @"";
         if(error2 == nil && notebook != nil)
         {
         passed = true;
         message = @"Ok - ";
         }else{
         message = @"Not - ";
         if(error!= nil)
         message = [message stringByAppendingString: [error localizedDescription]];
         }
         
         test.passed = passed;
         [test.executionMessages addObject:message];
         result(test);
         
         }] resume];
         }else{*/
        NSString *message = @"Not - Error getting sections";
        
        if(error!= nil){
            message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = false;
        [test.executionMessages addObject:message];
        result(test);
        //}
    }];
}

- (void)testGetPageContent:(void (^) (Test*))result{
    
    return [[self.client.me.notes.pages top:1] readWithCallback:^(NSArray *pages, MSOrcError *error) {
        MSOneNoteApiPage *page = [pages objectAtIndex:0];
        
        [[self.client.me.notes.pages getById:page._id] getContentWithCallback:^(NSData *content, MSOrcError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(error == nil && content != nil && content.length > 0)
            {
                passed = true;
                message = @"Ok - ";
            }else{
                message = @"Not - ";
                if(error!= nil)
                    message = [message stringByAppendingString: [error localizedDescription]];
            }
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            result(test);
        }];
    }];
}

- (void)testCreateSimplePage:(void(^)(Test *))result {
    
    NSString *simpleHtml = [NSString stringWithFormat: @"<html><head><title>A simple page created from basic HTML-formatted text</title><meta name=\"created\" content=\"%@\" /></head><body><p>This is a page that just contains some simple <i>formatted</i> <b>text</b></p><p>Here is a <a href=\"http://www.microsoft.com\">link</a></p></body></html>", @"2013-06-11T12:45:00.000-8:00"];
    
    NSMutableArray *multiparElements = [[NSMutableArray alloc] init];
    MSOrcMultiPartElement *m1 = [[MSOrcMultiPartElement alloc] initWithName:@"Presentation" andContentString:simpleHtml];
    [multiparElements addObject:m1];
    
    
    return [self.client.me.notes.pages addParts:((NSMutableArray<MSOrcMultiPartElement> *)multiparElements) withCallback:^(id<MSOrcResponse> response, MSOrcError *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(error!= nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

- (void)testSearchPage:(void(^)(Test *))result {
    
    NSString *imagePartName = @"sampleImage1";
    NSString *simpleHtml = [NSString stringWithFormat: @"<html><head><title>A simple page created with an image on it</title>\
                            <meta name=\"created\" content=\"%@\" />\
                            </head><body><h1>This is a page with an image on it</h1><img src=\"name:%@\" alt=\"A beautiful logo\"/></body></html>", [self getSerializedCurrentDate],imagePartName];
    
    UIImage *someImage = [UIImage imageNamed: @"office365"];
    NSData *contentBytes = UIImagePNGRepresentation(someImage);
    
    NSMutableArray *multiparElements = [[NSMutableArray alloc] init];
    
    MSOrcMultiPartElement *m1 = [[MSOrcMultiPartElement alloc] initWithName:@"Presentation" andContentString:simpleHtml];
    MSOrcMultiPartElement *m2 = [[MSOrcMultiPartElement alloc] initWithName:imagePartName andContentType:@"image/png" andContent:contentBytes];
    
    [multiparElements addObject:m1];
    [multiparElements addObject:m2];
    
    __weak OneNoteTestRunner *weakSelf = self;
    
    return [weakSelf.client.me.notes.pages addParts:(NSMutableArray<MSOrcMultiPartElement> *)multiparElements
                          withCallback:^(id<MSOrcResponse> response, MSOrcError *error) {
        
        [[weakSelf.client.me.notes.pages search:@"A simple page created with an image on it"] readWithCallback:^(NSArray *pages, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(error == nil && pages.count > 0)
            {
                passed = true;
                message = @"Ok - ";
            }else{
                message = @"Not - ";
                if(error!= nil)
                    message = [message stringByAppendingString: [error localizedDescription]];
            }
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            result(test);
            
        }];
    }];
}

- (void)testCreatePageWithEmbeddedWebImage:(void (^) (Test*))result{
    
    NSString *embeddedPartName = @"embedded1";
    NSString *embeddedWebPage = @"<html><head><title>An embedded webpage</title></head><body><h1>This is a screen grab of a web page</h1>\
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vehicula magna quis mauris accumsan, nec imperdiet nisi tempus. Suspendisse potenti. \
    Duis vel nulla sit amet turpis venenatis elementum. Cras laoreet quis nisi et sagittis. Donec euismod at tortor ut porta. Duis libero urna, viverra id\
    aliquam in, ornare sed orci. Pellentesque condimentum gravida felis, sed pulvinar erat suscipit sit amet. Nulla id felis quis sem blandit dapibus. Ut \
    viverra auctor nisi ac egestas. Quisque ac neque nec velit fringilla sagittis porttitor sit amet quam.</p>\
    </body></html>";
    
    NSString *simpleHtml = [NSString stringWithFormat: @"<html><head><title>A page created with an image of an html page on it</title>\
                            <meta name=\"created\" content=\"%@\" />\
                            </head><body><h1>This is a page with an image of an html page on it.</h1>\
                            <img data-render-src=\"name:%@\" alt=\"A website screen grab\" /></body></html>",[self getSerializedCurrentDate], embeddedPartName ];
    
    NSMutableArray* multiparElements = [[NSMutableArray alloc] init];
    MSOrcMultiPartElement *m1 = [[MSOrcMultiPartElement alloc] initWithName:@"Presentation" andContentString:simpleHtml];
    MSOrcMultiPartElement *m2 = [[MSOrcMultiPartElement alloc] initWithName:embeddedPartName andContentString:embeddedWebPage];
    [multiparElements addObject:m1];
    [multiparElements addObject:m2];
    
    
    return [self.client.me.notes.pages addParts:(NSMutableArray<MSOrcMultiPartElement> *)multiparElements withCallback:^(id<MSOrcResponse> response, MSOrcError *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        
        if(error == nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(error!= nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

- (void)testCreatePageWithImage:(void (^)(Test*))result{
    
    NSString *imagePartName = @"sampleImage1";
    NSString *simpleHtml = [NSString stringWithFormat: @"<html><head><title>A simple page created with an image on it</title>\
                            <meta name=\"created\" content=\"%@\" />\
                            </head><body><h1>This is a page with an image on it</h1><img src=\"name:%@\" alt=\"A beautiful logo\"/></body></html>", [self getSerializedCurrentDate],imagePartName];
    
    UIImage * someImage = [UIImage imageNamed: @"office365"];
    NSData *contentBytes = UIImagePNGRepresentation(someImage);
    
    NSMutableArray *multiparElements = [[NSMutableArray alloc] init];
    MSOrcMultiPartElement *m1 = [[MSOrcMultiPartElement alloc] initWithName:@"Presentation" andContentString:simpleHtml];
    MSOrcMultiPartElement *m2 = [[MSOrcMultiPartElement alloc] initWithName:imagePartName andContentType:@"image/png" andContent:contentBytes];
    [multiparElements addObject:m1];
    [multiparElements addObject:m2];
    
    return [self.client.me.notes.pages addParts:((NSMutableArray<MSOrcMultiPartElement> *)multiparElements)
                          withCallback:^(id<MSOrcResponse> response, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
                              
        if (error == nil) {
            
            passed = true;
            message = @"Ok - ";
        }
        else {
            
            message = @"Not - ";
            
            if(error!= nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

- (void)testCreatePageWithNoteTags:(void (^) (Test*))result{
    NSString *simpleHtml = [NSString stringWithFormat: @"<html>\
                            <head>\
                            <title data-tag=\"to-do:completed\">A page created with note tags</title>\
                            <meta name=\"created\" content=\"%@\" />\
                            </head>\
                            <body>\
                            <h1 data-tag=\"important\">Paragraphs with predefined note tags</h1>\
                            <p data-tag=\"to-do\">Paragraph with note tag to-do (data-tag=\"to-do\")</p>\
                            <p data-tag=\"important\">Paragraph with note tag important (data-tag=\"important\")</p>\
                            <p data-tag=\"question\">Paragraph with note tag question (data-tag=\"question\")</p>\
                            <p data-tag=\"definition\">Paragraph with note tag definition (data-tag=\"definition\")</p>\
                            <p data-tag=\"highlight\">Paragraph with note tag highlight (data-tag=\"contact\")</p>\
                            <p data-tag=\"contact\">Paragraph with note tag contact (data-tag=\"contact\")</p>\
                            <p data-tag=\"address\">Paragraph with note tag address (data-tag=\"address\")</p>\
                            <p data-tag=\"phone-number\">Paragraph with note tag phone-number (data-tag=\"phone-number\")</p>\
                            <p data-tag=\"web-site-to-visit\">Paragraph with note tag web-site-to-visit (data-tag=\"web-site-to-visit\")</p>\
                            <p data-tag=\"idea\">Paragraph with note tag idea (data-tag=\"idea\")</p>\
                            <p data-tag=\"password\">Paragraph with note tag password (data-tag=\"critical\")</p>\
                            <p data-tag=\"critical\">Paragraph with note tag critical (data-tag=\"project-a\")</p>\
                            <p data-tag=\"project-a\">Paragraph with note tag project-a (data-tag=\"project-b\")</p>\
                            <p data-tag=\"project-b\">Paragraph with note tag project-b (data-tag=\"remember-for-later\")</p>\
                            <p data-tag=\"remember-for-later\">Paragraph with note tag remember-for-later (data-tag=\"remember-for-later\")</p>\
                            <p data-tag=\"movie-to-see\">Paragraph with note tag movie-to-see (data-tag=\"movie-to-see\")</p>\
                            <p data-tag=\"book-to-read\">Paragraph with note tag book-to-read (data-tag=\"book-to-read\")</p>\
                            <p data-tag=\"music-to-listen-to\">Paragraph with note tag music-to-listen-to (data-tag=\"music-to-listen-to\")</p>\
                            <p data-tag=\"source-for-article\">Paragraph with note tag source-for-article (data-tag=\"source-for-article\")</p>\
                            <p data-tag=\"remember-for-blog\">Paragraph with note tag remember-for-blog (data-tag=\"remember-for-blog\")</p>\
                            <p data-tag=\"discuss-with-person-a\">Paragraph with note tag discuss-with-person-a (data-tag=\"discuss-with-person-a\")</p>\
                            <p data-tag=\"discuss-with-person-b\">Paragraph with note tag discuss-with-person-b (data-tag=\"discuss-with-person-a\")</p>\
                            <p data-tag=\"discuss-with-manager\">Paragraph with note tag discuss-with-manager (data-tag=\"discuss-with-manager\")</p>\
                            <p data-tag=\"send-in-email\">Paragraph with note tag send-in-email (data-tag=\"send-in-email\")</p>\
                            <p data-tag=\"schedule-meeting\">Paragraph with note tag schedule-meeting (data-tag=\"schedule-meeting\")</p>\
                            <p data-tag=\"call-back\">Paragraph with note tag call-back (data-tag=\"call-back\")</p>\
                            <p data-tag=\"to-do-priority-1\">Paragraph with note tag to-do-priority-1 (data-tag=\"to-do-priority-1\")</p>\
                            <p data-tag=\"to-do-priority-2\">Paragraph with note tag to-do-priority-2 (data-tag=\"to-do-priority-2\")</p>\
                            <p data-tag=\"client-request\">Paragraph with note tag client-request (data-tag=\"client-request\")</p>\
                            <br/>\
                            <p style=\"font-size: 16px; font-family: Calibri, sans-serif\">Paragraphs with note tag status</p>\
                            <p data-tag=\"to-do:completed\">Paragraph with note tag status completed</p>\
                            <p data-tag=\"call-back:completed\">Paragraph with note tag status completed</p>\
                            <br/>\
                            <p style=\"font-size: 16px; font-family: Calibri, sans-serif\">Paragraph with multiple note tags</p>\
                            <p data-tag=\"critical, question\">Paragraph with two note tags</p>\
                            <p data-tag=\"password, send-in-email\">Multiple note tags</p>\
                            <h1>List Item with a note tag</h1>\
                            <li data-tag=\"to-do\" id=\"todoitem2\">Build a todo app with OneNote APIs</li>\
                            <p style=\"font-size: 16px; font-family: Calibri, sans-serif\">Image with note tag</p>\
                            <img data-tag=\"important\" src=\"http://placecorgi.com/300\" />\
                            </body>\
                            </html>",[self getSerializedCurrentDate]];
    
    NSMutableArray *multiparElements = [[NSMutableArray alloc] init];
    MSOrcMultiPartElement *m1 = [[MSOrcMultiPartElement alloc] initWithName:@"Presentation" andContentString:simpleHtml];
    [multiparElements addObject:m1];
    
    return [self.client.me.notes.pages addParts:((NSMutableArray<MSOrcMultiPartElement> *)multiparElements)
                          withCallback:^(id<MSOrcResponse> response, MSOrcError *error) {
                              
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(error!= nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}


- (void)testCreatePageWithAttachment:(void (^) (Test*))result{
    NSString *attachmentPartName = @"attachment1";
    NSString *pageHtml = [NSString stringWithFormat: @"<html><head><title>A page created with a file attachment</title>\
                          <meta name=\"created\" content=\"%@\" /></head>\
                          <body><h1>This is a page with a text file attachment</h1>\
                          <object data-attachment=\"dummyFile.txt\" data=\"name:\%@\" /></body></html>", [self getSerializedCurrentDate], attachmentPartName ];
    
    NSData *attachmentContent = [@"Dummy content" dataUsingEncoding: NSUTF8StringEncoding];
    
    NSMutableArray *multiparElements = [[NSMutableArray alloc] init];
    MSOrcMultiPartElement *m1 = [[MSOrcMultiPartElement alloc] initWithName:@"Presentation" andContentString:pageHtml];
    MSOrcMultiPartElement *m2 = [[MSOrcMultiPartElement alloc] initWithName:attachmentPartName andContentType:@"text/plain" andContent:attachmentContent];
    [multiparElements addObject:m1];
    [multiparElements addObject:m2];
    
    return [self.client.me.notes.pages addParts:((NSMutableArray<MSOrcMultiPartElement> *)multiparElements) withCallback:^(id<MSOrcResponse> response, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(error!= nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

-(NSString *) getSerializedCurrentDate{
    return [MSOCalendarSerializer serialize:[NSDate date]];
}

/*
 -(NSData *) getFile{
 NSString *path;
 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
 path = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"TestAppDirectory"];
 path = [path stringByAppendingPathComponent:@"MyTestFile"];
 
 if ([[NSFileManager defaultManager] fileExistsAtPath:path])
 {
 //File exists
 NSData *file1 = [[NSData alloc] initWithContentsOfFile:path];
 if (file1)
 {
 return file1;
 }
 }
 else
 {
 NSData *file;
 file = [@"Dummy text file" dataUsingEncoding: NSUTF8StringEncoding];
 NSString *path;
 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
 path = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"TestAppDirectory"];
 path = [path stringByAppendingPathComponent:@"MyTestFile"];
 
 [[NSFileManager defaultManager] createFileAtPath:path
 contents:file
 attributes:nil];
 }
 
 return nil;
 }
 */
@end
