//
//  inputHandler.m
//  Maths
//
//  Created by Andre Mejia on 2020-03-26.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "inputHandler.h"

@implementation inputHandler

+ (NSString *) getInput {
    char inputChar [255];
    fgets(inputChar, 255, stdin);
    NSString *inputString = [NSString stringWithUTF8String:inputChar];
    inputString =[inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return inputString;
}

@end
