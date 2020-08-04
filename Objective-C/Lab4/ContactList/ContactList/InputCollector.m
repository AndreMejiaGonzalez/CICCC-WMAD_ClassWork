//
//  InputCollector.m
//  ContactList
//
//  Created by Andre Mejia on 2020-04-03.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (instancetype)init
{
    self = [super init];
    if (self) {
        _commands = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)inputForPrompt:(NSString *)promptString {
    char inputChars[100];
    NSLog(@"%@", promptString);
    fgets(inputChars, 100, stdin);
    NSString *inputString = [[[NSString stringWithUTF8String:inputChars] lowercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [self.commands addObject:inputString];
    return inputString;
}

- (void)showHistory {
    if ([self.commands count] <= 3) {
        NSLog(@"%@", self.commands);
    } else {
        NSMutableArray *lastThree = [[NSMutableArray alloc] init];
        for (int i = [self.commands count] - 3; i < [self.commands count]; i++) {
            [lastThree addObject:self.commands[i]];
        }
        NSLog(@"%@", lastThree);
    }
}

@end
