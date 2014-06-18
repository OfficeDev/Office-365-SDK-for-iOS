//
//  ServiceTableViewController.h
//  ToDoList
//
//  Created by Lagash on 6/17/14.
//
//

#import <UIKit/UIKit.h>
#import <office365-base-sdk/office365_base_sdk-Swift.h>

@interface ServiceTableViewController : UITableViewController
    @property NSMutableArray *servicesItems;
    @property NSString* token;

-(void)addToken:(NSString*) accesToken;


@end
