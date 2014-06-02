//
//  DataBaseAccess.h
//  ToDoList
//
//  Created by Lagash on 5/9/14.
//
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "ToDoItem.h"

@interface DataBaseAccess : NSObject{
    
    sqlite3 *_toDoDataBase;
    NSString *_dataBasePath;
}

-(void)initialize;
-(ToDoItem *)findById:(id)idObject;
-(void)save:(ToDoItem *)toDoItem;
-(NSMutableArray *)findAll;
-(void)delete:(int)idObject;
-(void)update:(ToDoItem*)item;

@end
