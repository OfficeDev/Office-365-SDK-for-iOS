//
//  ServiceTableViewController.h
//  ToDoList
//
//  Created by Lagash on 6/17/14.
//
//

#import <UIKit/UIKit.h>

@class OAuthentication;

@interface ServiceTableViewController : UITableViewController
    @property NSMutableArray *servicesItems;
    @property NSString* token;


-(void)addToken:(NSString*) accesToken;


@end
