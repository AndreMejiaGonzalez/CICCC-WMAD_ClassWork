//
//  GameController.m
//  Threelow
//
//  Created by Andre Mejia on 2020-04-07.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "GameController.h"

@implementation GameController


//Custom initializer that initializes two empty arrays to hold the dice
- (instancetype)init
{
    self = [super init];
    if (self) {
        _dice = [[NSMutableArray alloc] init];
        _heldDice = [[NSMutableArray alloc] init];
        _bestScore = 30;
    }
    return self;
}


//Returns a string representation of the dice at play
- (NSString *)diceString {
    NSMutableString *workingString = [NSMutableString stringWithFormat:@" "];
    for (Dice *die in self.dice) {
        [workingString appendFormat:@"%@ ", die.value];
    }
    return [NSString stringWithFormat:@"Dice: [%@]", workingString];
}


//Returns a string representation of the held dice
- (NSString *)heldString {
    NSMutableString *workingString = [NSMutableString stringWithFormat:@" "];
    for (Dice *die in self.heldDice) {
        [workingString appendFormat:@"%@ ", die.value];
    }
    return [NSString stringWithFormat:@"Held Dice: [%@]", workingString];
}

//Returns score
- (NSInteger)score {
    NSInteger output = 0;
    for (Dice *die in self.heldDice) {
        if ([die.value isEqualToString:@"⚀"]) {
            output ++;
        } else if ([die.value isEqualToString:@"⚁"]) {
            output += 2;
        } else if ([die.value isEqualToString:@"⚂"]) {
            output += 0;
        } else if ([die.value isEqualToString:@"⚃"]) {
            output += 4;
        } else if ([die.value isEqualToString:@"⚄"]) {
            output += 5;
        } else if ([die.value isEqualToString:@"⚅"]) {
            output += 6;
        } else {
            output += 0;
        }
    }
    return output;
}

//Randomizes all dice at play
- (void)rollDice:(NSMutableArray *)dice {
    for (Dice *die in dice) {
        [die randomizeValue];
    }
}

//Takes specified die and swaps it to the held array
- (void)holdDie:(NSInteger)index {
    Dice *die = self.dice[index];
    [self.dice removeObjectAtIndex:index];
    [self.heldDice addObject:die];
    
}

//Takes specified die and swaps it to the dice array
- (void)unHoldDie:(NSInteger)index {
    Dice *die = self.heldDice[index];
    [self.heldDice removeObjectAtIndex:index];
    [self.dice addObject:die];
}

//Resets dice and rolls
- (void)reset {
    while ([self.heldDice count] > 0) {
        [self unHoldDie:0];
    }
    self.rolls = 0;
}

//Prints all the game data
- (void)printStatus {
    NSLog(@"\n%@\n%@\nCurrent Score: %ld\nRolls since last reset: %ld\nScore to beat: %ld\n", self.diceString, self.heldString, self.score, self.rolls, self.bestScore);
}

@end
