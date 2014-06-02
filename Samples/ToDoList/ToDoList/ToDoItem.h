//
//  ToDoItem.h
//  ToDoList
//
//  Created by Lagash on 5/8/14.
//
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property int Id;
@property NSString *name;
@property BOOL isCompleted;
@property NSDate *creationDate;

@end
