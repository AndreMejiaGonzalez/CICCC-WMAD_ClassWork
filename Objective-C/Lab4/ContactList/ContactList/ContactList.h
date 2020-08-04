//
//  ContactList.h
//  ContactList
//
//  Created by Andre Mejia on 2020-04-03.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactList : NSObject

@property NSMutableArray *contactList;

-(void)addContact: (Contact *)newContact;

-(void)printContactList;

-(void)showContactWithID: (NSInteger)index;

-(void)findContactWithName: (NSString *)name;

-(BOOL)checkForDuplicate: (NSString *)email;

@end

NS_ASSUME_NONNULL_END
