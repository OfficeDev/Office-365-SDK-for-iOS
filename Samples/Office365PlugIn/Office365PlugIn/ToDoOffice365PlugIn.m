//
//  ToDoOffice365PlugIn.m
//  ToDoOffice365PlugIn
//
//  Created by Lagash on 6/3/14.
//    Copyright (c) 2014 microsoft. All rights reserved.
//

#import "ToDoOffice365PlugIn.h"
#import "OfficeWindowController.h"
static ToDoOffice365PlugIn *sharedPlugin;

@interface ToDoOffice365PlugIn()

@property (nonatomic, strong) NSBundle *bundle;
@property (nonatomic, strong) OfficeWindowController *officeWindowController;
@end

@implementation ToDoOffice365PlugIn

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[self alloc] initWithBundle:plugin];
        });
    }
}

- (id)initWithBundle:(NSBundle *)plugin
{
    if (self = [super init]) {
        // reference to plugin's bundle, for resource acccess
        self.bundle = plugin;
        
        // Create menu items, initialize UI, etc.

        // Sample Menu Item:
        NSMenuItem *menuItem = [[NSApp mainMenu] itemWithTitle:@"File"];
        if (menuItem) {
            [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
            NSMenuItem *actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Office 365 Service" action:@selector(doMenuAction) keyEquivalent:@""];
            [actionMenuItem setTarget:self];
            [[menuItem submenu] addItem:actionMenuItem];
        }
    }
    return self;
}

// Sample Action, for menu item:
- (void)doMenuAction
{
    self.officeWindowController= [[OfficeWindowController alloc] initWithWindowNibName: @"Office365"];
    [self.officeWindowController showWindow:self];
  //  NSAlert *alert = [NSAlert alertWithMessageText:@"Hola, World" defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
  //  [alert runModal];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
