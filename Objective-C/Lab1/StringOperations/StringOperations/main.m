//
//  main.m
//  StringOperations
//
//  Created by Andre Mejia on 2020-03-30.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    char inputChars[255];
    while (YES) {
        NSLog(@"Select Operation:\n1.Uppercase 2.Lowercase 3.Numberize 4.Canadianize 5.Respond 6.De-Space");
        fgets(inputChars, 255, stdin);
        NSString *operationInput = [NSString stringWithUTF8String:inputChars];
        operationInput = [operationInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSLog(@"Input a String:");
        fgets(inputChars, 255, stdin);
        NSString *inputString = [NSString stringWithUTF8String:inputChars];
        inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([operationInput isEqualToString:@"1"]) {
            NSString *output = [inputString uppercaseString];
            NSLog(@"Output: %@", output);
        } else if ([operationInput isEqualToString:@"2"]) {
            NSString *output = [inputString lowercaseString];
            NSLog(@"Output: %@", output);
        } else if ([operationInput isEqualToString:@"3"]) {
            NSInteger output = [inputString intValue];
            NSLog(@"Output: %ld", output);
        } else if ([operationInput isEqualToString:@"4"]) {
            NSString *output = [NSString stringWithFormat:@"%@, eh?", inputString];
            NSLog(@"Output: %@", output);
        } else if ([operationInput isEqualToString:@"5"]) {
            NSString *lastChar = [inputString substringFromIndex:[inputString length] - 1];
            if ([lastChar isEqualToString:@"?"]) {
                NSLog(@"Output: I Don't Know");
            } else if ([lastChar isEqualToString:@"!"]) {
                NSLog(@"Output: Whoa, Calm Down!");
            } else {
                NSLog(@"Output: No Response");
            }
        } else if ([operationInput isEqualToString:@"6"]) {
            NSString *output = [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
            NSLog(@"Output: %@", output);
        } else {
            NSLog(@"Please Input a Valid Operation Number");
        }
    }
    return 0;
}
