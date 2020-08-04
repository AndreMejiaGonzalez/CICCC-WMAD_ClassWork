//
//  main.m
//  PigLatin
//
//  Created by Andre Mejia on 2020-04-01.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+pigLatin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char inputChar[100];
        while (TRUE) {
            fgets(inputChar, 100, stdin);
            NSString *inputString = [[NSString stringWithUTF8String:inputChar] lowercaseString];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            NSLog(@"%@", [inputString stringByPigLatinization]);
        }
    }
    return 0;
}
