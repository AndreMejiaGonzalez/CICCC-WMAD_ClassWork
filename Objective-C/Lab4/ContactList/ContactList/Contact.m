//
//  Contact.m
//  ContactList
//
//  Created by Andre Mejia on 2020-04-03.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (instancetype)init
{
    self = [super init];
    if (self) {
        _numbers = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end
