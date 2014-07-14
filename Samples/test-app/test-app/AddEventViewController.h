//
//  AddEventViewController.h
//  test-app
//
//  Created by Gustavo on 7/14/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEventViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *EventTitle;
@property (weak, nonatomic) IBOutlet UIDatePicker *EventStartDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *EventEndDate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *SaveButton;

@end