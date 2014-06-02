//
//  AddToDoItemViewController.m
//  ToDoList
//
//  Created by Lagash on 5/8/14.
//
//

#import "AddToDoItemViewController.h"
#import "DataBaseAccess.h"

@interface AddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AddToDoItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    @autoreleasepool {
        
        if(sender != self.doneButton) return;
        
        if(self.textField.text.length > 0){
            self.toDoItem = [[ToDoItem alloc] init];
            self.toDoItem.name = self.textField.text;
            self.toDoItem.isCompleted = false;
            
            DataBaseAccess *dba = [DataBaseAccess alloc];
            
            [dba save:self.toDoItem];
        }
    }
}


@end
