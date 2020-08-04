//
//  main.m
//  ContactList
//
//  Created by Andre Mejia on 2020-04-03.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        InputCollector *input = [[InputCollector alloc] init];
        Contact *contact = [[Contact alloc] init];
        ContactList *list = [[ContactList alloc] init];
        while (TRUE) {
            NSString *inputString = [input inputForPrompt:@"What would you like to do next?\n\nNew - Create contact.\n\nList - List all contacts.\n\nShow - Show contact at an index. \n\nFind - Find a specific contact. \n\nHistory - Show last three commands. \n\nQuit - Exit application.\n\n>_"];
            if ([inputString isEqualToString:@"new"]) {
                contact.name = [input inputForPrompt:@"Input contact name:"];
                contact.email = [input inputForPrompt:@"Input contact e-mail:"];
                if ([list checkForDuplicate:contact.email]) {
                    NSLog(@"Contact already exists");
                    continue;
                }
                while ([[input inputForPrompt:@"Want to input a phone number? Yes/No"] isEqualToString:@"yes"]) {
                    NSString *label = [input inputForPrompt:@"Input a label:"];
                    NSString *phoneNumber = [input inputForPrompt:@"Input a phone number:"];
                    [contact.numbers setObject:phoneNumber forKey:label];
                }
                [list addContact:contact];
            } else if ([inputString isEqualToString:@"list"]) {
                [list printContactList];
            } else if ([inputString isEqualToString:@"show"]) {
                NSInteger index = [[input inputForPrompt:@"Input an index:"] intValue];
                [list showContactWithID:index];
            } else if ([inputString isEqualToString:@"find"]) {
                NSString *name = [input inputForPrompt:@"Input a name:"];
                [list findContactWithName:name];
            } else if ([inputString isEqualToString:@"history"]) {
                [input showHistory];
            } else if ([inputString isEqualToString:@"quit"]) {
                NSLog(@"Goodbye!");
                break;
            }  else {
                NSLog(@"Please input a valid command");
                continue;
            }
        }
    }
    return 0;
}
