//
//  DataBaseAccess.m
//  ToDoList
//
//  Created by Lagash on 5/9/14.
//
//

#import "DataBaseAccess.h"

@implementation DataBaseAccess

-(void)initialize{
    
    @autoreleasepool {
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,  true);
        
        _dataBasePath = [[NSString alloc] initWithString:[paths[0] stringByAppendingString: @"toDoItems"]];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if(![fileManager fileExistsAtPath:_dataBasePath]){
            const char *dbPath = [_dataBasePath UTF8String];
            
            if(sqlite3_open(dbPath, &_toDoDataBase)  == SQLITE_OK){
                char *errorMesssage;
                const char *createQuery = "CREATE TABLE IF NOT EXISTS TODOITEMS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ISCOMPLETE INTEGER, CREATEDDATE TEXT)";
                
                if (sqlite3_exec(_toDoDataBase, createQuery, NULL, NULL, &errorMesssage) != SQLITE_OK)
                {
                    NSLog(@"Failed to create table");
                    //status.text = ;
                }
                
                
                sqlite3_close(_toDoDataBase);
            }
            else{
                NSLog(@"Failed to create database");
            }
        }
    }
    
}

-(ToDoItem *)findById:(id)idObject
{
    return nil;
}

-(void)save:(ToDoItem *)toDoItem
{
    @autoreleasepool {
        
        sqlite3_stmt *stmt;

        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,  true);
        _dataBasePath = [[NSString alloc] initWithString:[paths[0] stringByAppendingString: @"toDoItems"]];
        
        const char *dbPath = [_dataBasePath UTF8String];
        
        if(sqlite3_open(dbPath, &_toDoDataBase)  == SQLITE_OK){
            NSDate *today = [NSDate date];
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"dd/MM/yyyy"];
            NSString *dateString = [dateFormat stringFromDate:today];
            
            NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO TODOITEMS (NAME, ISCOMPLETE, CREATEDDATE) VALUES (\'%@\', \'%@\', \'%@\')", toDoItem.name, @"0", dateString];

            const char *sqlUtf = [insertSQL UTF8String];
            
            sqlite3_prepare_v2(_toDoDataBase, sqlUtf, -1, &stmt, NULL);
            
            int step = sqlite3_step(stmt);
            if (step == SQLITE_DONE)
            {
                NSLog(@"Success");
            }else
            {
                NSLog(@"Failed to save item");
                //status.text = ;
            }
            
            sqlite3_finalize(stmt);
            sqlite3_close(_toDoDataBase);
        }
        else{
            NSLog(@"Failed to open database");
        }

        
    }
}

-(NSMutableArray *)findAll
{
    NSMutableArray *listItem = [[NSMutableArray alloc] init];
    
    @autoreleasepool {

        sqlite3_stmt *stmt;
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,  true);
        _dataBasePath = [[NSString alloc] initWithString:[paths[0] stringByAppendingString: @"toDoItems"]];
        
        const char *dbPath = [_dataBasePath UTF8String];
        
        if(sqlite3_open(dbPath, &_toDoDataBase) == SQLITE_OK){
            
                NSString *queryString = @"SELECT * FROM TODOITEMS";
            
            const char *utfQuery = [queryString UTF8String];
            
            if(sqlite3_prepare_v2(_toDoDataBase, utfQuery, -1, &stmt, NULL) == SQLITE_OK){
                
                while(sqlite3_step(stmt) == SQLITE_ROW){
                    ToDoItem *item = [ToDoItem alloc];
                    item.Id = ((int)sqlite3_column_int(stmt, 0));
                    item.name = [[NSString alloc] initWithUTF8String: (char*)   sqlite3_column_text(stmt, 1)];
                    item.isCompleted = (int*) sqlite3_column_int(stmt, 2) == 0 ? false : true;
                    
                    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
                    [formater setDateFormat: @"EE, d LLLL yyyy"];
                    
                    item.creationDate = [formater dateFromString: [[NSString alloc] initWithUTF8String:(char*) sqlite3_column_text(stmt, 3)]];
                    
                    [listItem addObject:item];
                    
                }
            }
            
            sqlite3_finalize(stmt);
            sqlite3_close(_toDoDataBase);
        }
        
    }
    return listItem;
}

-(void)delete:(int)obejectId
{
    @autoreleasepool {
        sqlite3_stmt *stmt;
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,  true);
        _dataBasePath = [[NSString alloc] initWithString:[paths[0] stringByAppendingString: @"toDoItems"]];
        
        const char *dbPath = [_dataBasePath UTF8String];
        
        if(sqlite3_open(dbPath, &_toDoDataBase) == SQLITE_OK){
            
            NSString *queryString = [NSString stringWithFormat: @"DELETE FROM TODOITEMS WHERE ID = %d", obejectId];
            
            const char *utfQuery = [queryString UTF8String];
            int prepare = sqlite3_prepare_v2(_toDoDataBase, utfQuery, -1, &stmt, NULL);
            
            if(prepare == SQLITE_OK){
                char *errorMesssage;
                if (sqlite3_exec(_toDoDataBase, utfQuery, NULL, NULL, &errorMesssage) != SQLITE_OK)
                {
                    NSLog(@"Failed to delete item");
                }
                
                sqlite3_finalize(stmt);
                sqlite3_close(_toDoDataBase);
            }
        }
    }
}

-(void)update:(ToDoItem*)item
{
    @autoreleasepool {
        
        sqlite3_stmt *stmt;
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,  true);
        _dataBasePath = [[NSString alloc] initWithString:[paths[0] stringByAppendingString: @"toDoItems"]];
        
        const char *dbPath = [_dataBasePath UTF8String];
        
        if(sqlite3_open(dbPath, &_toDoDataBase) == SQLITE_OK){
            
            NSString *queryString = [NSString stringWithFormat: @"UPDATE TODOITEMS SET ISCOMPLETE = \'%@\' WHERE ID = %d", item.isCompleted ? @"1" : @"0" , item.Id];
            
            const char *utfQuery = [queryString UTF8String];
            
            if(sqlite3_prepare_v2(_toDoDataBase, utfQuery, -1, &stmt, NULL) == SQLITE_OK){
                char *errorMesssage;
                if (sqlite3_exec(_toDoDataBase, utfQuery, NULL, NULL, &errorMesssage) != SQLITE_OK)
                {
                    NSLog(@"Failed to update item");
                }

                sqlite3_finalize(stmt);
                sqlite3_close(_toDoDataBase);
            }
        }
    }
}

@end
