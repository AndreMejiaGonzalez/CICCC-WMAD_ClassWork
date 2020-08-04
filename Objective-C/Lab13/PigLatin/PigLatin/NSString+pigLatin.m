//
//  NSString+pigLatin.m
//  PigLatin
//
//  Created by Andre Mejia on 2020-04-01.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "NSString+pigLatin.h"

@implementation NSString (pigLatin)

- (NSString *)stringByPigLatinization {
    NSArray *consonants = @[@"b", @"c", @"d", @"f", @"g", @"h", @"j", @"k", @"l", @"m", @"n", @"p", @"q", @"r", @"s", @"t", @"v", @"w", @"x", @"y", @"z"];
    NSArray *twoConsonantClusters = @[@"br", @"bl", @"ch", @"cr", @"cl", @"sh", @"sm", @"sn", @"st", @"sw", @"sk", @"sl", @"sp", @"sq", @"th", @"tw", @"tr", @"ps", @"ph", @"pl", @"pr", @"gl", @"gr", @"dw", @"dr", @"fr", @"fl"];
    NSArray *threeConsonantClusters = @[@"thw", @"thr", @"sph", @"shr", @"spr", @"str", @"scr"];
    
    NSMutableString *output = [NSMutableString stringWithFormat:@""];
    NSArray *words = [self componentsSeparatedByString:@" "];
    for (int i = 0; i < [words count]; i++) {
        NSString *word = words[i];
        if ([word length] >= 4 && [threeConsonantClusters containsObject:[word substringToIndex:3]]) {
            [output appendFormat:@" %@", [NSString stringWithFormat:@"%@%@ay",[word substringFromIndex:3], [word substringToIndex:3]]];
        } else if ([word length] >= 3 && [twoConsonantClusters containsObject:[word substringToIndex:2]]) {
            [output appendFormat:@" %@", [NSString stringWithFormat:@"%@%@ay",[word substringFromIndex:2], [word substringToIndex:2]]];
        } else if ([word length] > 0 && [consonants containsObject:[word substringToIndex:1]]) {
            [output appendFormat:@" %@", [NSString stringWithFormat:@"%@%@ay",[word substringFromIndex:1], [word substringToIndex:1]]];
        } else {
            [output appendFormat:@" %@way", word];
        }
    }
    return [NSString stringWithFormat:@"%@", output];
}

@end
