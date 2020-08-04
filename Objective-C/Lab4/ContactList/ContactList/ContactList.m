//
//  ContactList.m
//  ContactList
//
//  Created by Andre Mejia on 2020-04-03.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

- (instancetype)init
{
    self = [super init];
    if (self) {
        _contactList = [[NSMutableArray alloc] init];
        Contact *contact1 = [[Contact alloc] init];
        contact1.name = @"Churp Nurple";
        contact1.email = @"churp_nurple@gmail.com";
        [contact1.numbers setObject:@"Mobile" forKey:@"6043135772"];
        Contact *contact2 = [[Contact alloc] init];
        contact2.name = @"Clap Traple";
        contact2.email = @"clap_t@gmail.com";
        [contact2.numbers setObject:@"Mobile" forKey:@"6021122874"];
        Contact *contact3 = [[Contact alloc] init];
        contact3.name = @"Jerkin McGerkin";
        contact3.email = @"jerkin@mcgerkin.com";
        [contact3.numbers setObject:@"Mobile" forKey:@"6042069333"];
        [_contactList addObject:contact1];
        [_contactList addObject:contact2];
        [_contactList addObject:contact3];
    }
    return self;
}

- (void)addContact:(Contact *)newContact {
    [self.contactList addObject:newContact];
}

- (void)printContactList {
    for (int i = 0; i < [self.contactList count]; i++) {
        Contact *contact = self.contactList[i];
        NSLog(@"#%d. Name: %@\t E-Mail: %@\n Phone Numbers: %@", i + 1, contact.name, contact.email, contact.numbers);
    }
}

- (void)showContactWithID:(NSInteger)index {
    if ((index - 1) >= 0 && (index - 1) < [self.contactList count]) {
        Contact *contact = self.contactList[index - 1];
        NSLog(@"#%ld. Name: %@\t E-Mail: %@\n Phone Numbers: %@", index, contact.name, contact.email, contact.numbers);
    } else {
        NSLog(@"Contact not found. Please input a valid index");
    }
}

- (void)findContactWithName:(NSString *)name {
    for (int i = 0; i < [self.contactList count]; i++) {
        Contact *contact = self.contactList[i];
        if ([[contact.name lowercaseString] containsString:name] || [[contact.email lowercaseString] containsString:name]) {
            NSLog(@"#%d. Name: %@\t E-Mail: %@\n Phone Numbers: %@", i + 1, contact.name, contact.email, contact.numbers);
            break;
        }
    }
}

- (BOOL)checkForDuplicate:(NSString *)email {
    for (int i = 0; i < [self.contactList count]; i++) {
        Contact *contact = self.contactList[i];
        if ([contact.email isEqualToString:email]) {
            return YES;
        }
    }
    return NO;
}

@end
