//
//  AddContactViewController.m
//  test-app
//
//  Created by Gustavo on 7/14/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "AddContactViewController.h"
#import "Contact.h"
#import <AddressBook/AddressBook.h>

@interface AddContactViewController ()

@end

@implementation AddContactViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    if(sender != self.SaveButton) return;
    
    Contact* contact = [Contact alloc];
    
    contact.Name = self.ContactName.text;
    contact.LastName = self.ContactLastName.text;
    contact.Email = self.ContactEmail.text;
    contact.CellPhone= self.ContactCellPhone.text;
    
    ABAddressBookRef addressBook = ABAddressBookCreate();
    ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
        if(granted) {
            ABRecordRef person = ABPersonCreate();
            ABRecordSetValue(person, kABPersonFirstNameProperty, (__bridge CFTypeRef)(self.ContactName.text), nil);
            ABRecordSetValue(person, kABPersonLastNameProperty, (__bridge CFTypeRef)(self.ContactLastName.text), nil);
            
            ABAddressBookAddRecord(addressBook, person, nil);
            ABAddressBookSave(addressBook, nil);
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

@end