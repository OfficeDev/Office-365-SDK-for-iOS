//
//  ContactsTableViewController.m
//  test-app
//
//  Created by Gustavo on 7/14/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "ContactsTableViewController.h"
#import <AddressBook/AddressBook.h>
#import "Contact.h"

@interface ContactsTableViewController ()

@end

@implementation ContactsTableViewController

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
    self.contacts = [[NSMutableArray alloc] init];
    [self FetchContacts];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contacts count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactsList" forIndexPath:indexPath];
    
    Contact* contact = (Contact*)[self.contacts objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", contact.Name, contact.LastName];
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        ABAddressBookRef addressBook = ABAddressBookCreate();
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            if(granted) {
               
                __block ABRecordRef contactToDelete = ABPersonCreate();
                 Contact* contact = [self.contacts objectAtIndex:indexPath.row];
                
                ABRecordSetValue(contactToDelete, kABPersonFirstNameProperty, (__bridge CFTypeRef)(contact.Name), nil);
                ABRecordSetValue(contactToDelete, kABPersonLastNameProperty, (__bridge CFTypeRef)(contact.LastName), nil);
                
                ABRecordRef person = ABAddressBookGetPersonWithRecordID(addressBook,contactToDelete);
                
                
                
                
                CFErrorRef error = nil;
                bool l = ABAddressBookRemoveRecord(addressBook, person, &error);
                bool ll = ABAddressBookSave(addressBook, &error);
                
                CFRelease(addressBook);
                
                /*  ABMutableMultiValueRef phoneNumberMultiValue = ABMultiValueCreateMutable(kABMultiStringPropertyType);
                 ABMultiValueAddValueAndLabel(phoneNumberMultiValue, (__bridge CFTypeRef)(self.ContactCellPhone.text), (CFStringRef)@"iPhone", nil);
                 ABRecordSetValue(person, kABPersonPhoneProperty, phoneNumberMultiValue, nil);
                 CFRelease(phoneNumberMultiValue);
                 
                 ABMutableMultiValueRef emailMultiValue = ABMultiValueCreateMutable(kABMultiStringPropertyType);
                 ABRecordSetValue(person, kABPersonURLProperty, emailMultiValue, nil);
                 CFRelease(emailMultiValue);
                 //Use the address book*/
            }
        });
        
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)unwindContacts:(UIStoryboardSegue *)segue{
    //[self FetchCalendarEvents];
    [self FetchContacts];
}

-(void)FetchContacts{
    CFErrorRef error = NULL;
    
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
    NSArray* temporalContacts = (__bridge_transfer NSArray*)ABAddressBookCopyArrayOfAllPeople(addressBook);
    NSMutableArray* contacts = [[NSMutableArray alloc] init];
    NSUInteger i;
    for (i = 0; i < [temporalContacts count]; i++) {
        ABRecordRef temporalContact = (__bridge ABRecordRef)temporalContacts[i];
        
        Contact* contact  =[Contact alloc];
        
        contact.Name = (__bridge_transfer NSString*)ABRecordCopyValue(temporalContact,kABPersonFirstNameProperty);
        contact.LastName = (__bridge_transfer NSString*)ABRecordCopyValue(temporalContact,kABPersonLastNameProperty);
      /*  contact.Email = (__bridge_transfer NSString*)ABRecordCopyValue(temporalContact,kABPersonEmailProperty);
        contact.CellPhone = (__bridge_transfer NSString*)ABRecordCopyValue(temporalContact,kABPersonPhoneProperty);
        */
        [contacts addObject:contact];
    }
    
    CFRelease(addressBook);
    self.contacts = contacts;
    [self.tableView reloadData];
}

@end


























