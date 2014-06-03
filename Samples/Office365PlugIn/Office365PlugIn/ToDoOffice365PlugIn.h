//
//  ToDoOffice365PlugIn.h
//  ToDoOffice365PlugIn
//
//  Created by Lagash on 6/3/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

#import <AppKit/AppKit.h>
#import <Cocoa/Cocoa.h>

@interface ToDoOffice365PlugIn : NSObject
{
    NSWindow *officeServiceWindow;
}

@property (assign) IBOutlet NSWindow *officeServiceWindow;
@end

