//
//  AddEventViewController.m
//  test-app
//
//  Created by Gustavo on 7/14/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "AddEventViewController.h"
#import <EventKit/EventKit.h>

@interface AddEventViewController ()

@end

@implementation AddEventViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if(sender != self.SaveButton) return;
    
    EKEventStore* store = [[EKEventStore alloc] init];
    
    [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        
        if(granted){
            
            EKEvent* event = [EKEvent eventWithEventStore:store];
            event.title = self.EventTitle.text;
            event.endDate = self.EventEndDate.date;
            event.startDate = self.EventStartDate.date;
            [event setCalendar:[store defaultCalendarForNewEvents]];
            NSError* error=nil;
            
            [store saveEvent:event span:EKSpanThisEvent commit:true error:&error];
        }
    }];
}

@end
