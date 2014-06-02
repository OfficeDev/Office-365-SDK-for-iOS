//
//  main.m
//  ToDoList
//
//  Created by Lagash on 5/8/14.
//
//

#import <UIKit/UIKit.h>

#import "ToDoAppDelegate.h"
#import "DataBaseAccess.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        DataBaseAccess *dba = [DataBaseAccess alloc];
        
        [dba initialize];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([ToDoAppDelegate class]));
    }
}
