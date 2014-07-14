//
//  CalendarTableViewController.m
//  test-app
//
//  Created by Gustavo on 7/14/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "CalendarTableViewController.h"
#import <EventKit/EventKit.h>

@interface CalendarTableViewController ()

@end

@implementation CalendarTableViewController

EKEventStore* store;

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    store = [[EKEventStore alloc] init];
    
    self.events = [[NSArray alloc] init];
    
    [self FetchCalendarEvents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CalendarTable" forIndexPath:indexPath];
    
    EKEvent* event = (EKEvent*)[self.events objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", event.title, event.startDate];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,50,50)];
        spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        [self.view addSubview:spinner];
        spinner.hidesWhenStopped = YES;
        
        [spinner startAnimating];
        
        [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
            
            if(granted){
                
                EKEvent* e = [self.events objectAtIndex:indexPath.row];
                EKEvent* event= [store eventWithIdentifier:e.eventIdentifier];
                NSError* error = nil;
                [store removeEvent:event span:EKSpanThisEvent error:&error];
                [self FetchCalendarEvents];
                [spinner stopAnimating];
            }
        }];
    }
}

- (IBAction)unwind:(UIStoryboardSegue *)segue{
    [self FetchCalendarEvents];
}

-(void)FetchCalendarEvents{
    UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,50,50)];
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:spinner];
    spinner.hidesWhenStopped = YES;
    
    [spinner startAnimating];
    
    [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        
        if(granted){
            NSCalendar* calendar = [NSCalendar currentCalendar];
            
            unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
            
            NSDate* date = [NSDate date];
            NSDateComponents* components = [calendar components:unitFlags fromDate:date];
            components.hour = 00;
            components.minute = 00;
            components.second = 00;
            
            NSDateComponents* endComponents = [calendar components:unitFlags fromDate:date];
            components.hour = 23;
            components.minute = 59;
            components.second = 59;
            
            NSDate* l =[calendar dateFromComponents: components];
            NSDate* e = [calendar dateFromComponents: endComponents];
            NSPredicate* predicate = [store predicateForEventsWithStartDate: e endDate:l calendars:nil];
            
            self.events = [store eventsMatchingPredicate:predicate];
            
            [self.tableView reloadData];
            [spinner stopAnimating];
        }
    }];
}

@end