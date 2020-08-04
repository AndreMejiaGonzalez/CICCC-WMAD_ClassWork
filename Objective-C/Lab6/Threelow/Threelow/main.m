//
//  main.m
//  Threelow
//
//  Created by Andre Mejia on 2020-04-07.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Initializing dice and controller
        GameController *controller = [[GameController alloc] init];
        Dice *dice1 = [[Dice alloc] init];
        [controller.dice addObject:dice1];
        Dice *dice2 = [[Dice alloc] init];
        [controller.dice addObject:dice2];
        Dice *dice3 = [[Dice alloc] init];
        [controller.dice addObject:dice3];
        Dice *dice4 = [[Dice alloc] init];
        [controller.dice addObject:dice4];
        Dice *dice5 = [[Dice alloc] init];
        [controller.dice addObject:dice5];
        
        //Initial roll
        [controller rollDice:controller.dice];
        
        //Setting up for user input
        char inputchar[100];
        
        //Infinite while loop to keep program from exiting
        while (true) {
            if ([controller.heldDice count] < 5) {
                //Getting user input
                [controller printStatus];
                NSLog(@"Input command: \n\nRoll - Roll dice\n\nHold # - Hold a specific die (# = number of die to hold from 1-5)\n\nUnHold # - Un-Hold a specific die (# = number of die to un-hold from 1-5)\n\nReset - reset all held dice\n\nNewGame - start a new game reseting the best score\n\nQuit - quit game");
                fgets(inputchar, 100, stdin);
                NSString *inputString = [[[NSString stringWithUTF8String:inputchar] lowercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                NSArray *commands = [inputString componentsSeparatedByString:@" "];
                
                //Checking input with valid commands
                if ([commands[0] isEqualToString:@"roll"]) {
                    if (controller.rolls < 5) {
                        //Rolling and printing dice value
                        [controller rollDice:controller.dice];
                        controller.rolls++;
                        //forcing player to hold at least one die after rolling
                        NSLog(@"%@", controller.diceString);
                        NSLog(@"Input a die to hold:");
                        fgets(inputchar, 100, stdin);
                        NSInteger dieInput = [[[NSString stringWithUTF8String:inputchar] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] intValue] - 1;
                        if (dieInput >= 0 && dieInput < [controller.dice count]) {
                            [controller holdDie:dieInput];
                        } else {
                            NSLog(@"Please input a valid index");
                        }
                    } else {
                        NSLog(@"You must reset before rolling again");
                    }
                } else if ([commands[0] isEqualToString:@"hold"]) {
                    //Holding selected die
                    NSInteger index = [commands[1] intValue] - 1;
                    //validating inputed index
                    if (index >= 0 && index < [controller.dice count]) {
                        [controller holdDie:index];
                    } else {
                        NSLog(@"Please input a valid index");
                    }
                } else if ([commands[0] isEqualToString:@"unhold"]) {
                    //Un-Holding selected die
                    NSInteger index = [commands[1] intValue] - 1;
                    //validating inputed index
                    if (index >= 0 && index < [controller.heldDice count]) {
                        [controller unHoldDie:index];
                    } else {
                        NSLog(@"Please input a valid index");
                    }
                } else if ([commands[0] isEqualToString:@"reset"]) {
                    //Reseting all dice and rolls
                    [controller reset];
                } else if ([commands[0] isEqualToString:@"newgame"]) {
                    controller.bestScore = 30;
                    [controller reset];
                    continue;
                } else if ([commands[0] isEqualToString:@"dev"]) {
                    controller.score = 0;
                    NSLog(@"Game Over\nYou won!\nYour score: %ld", controller.score);
                    controller.bestScore = controller.score;
                    [controller reset];
                    continue;
                } else if ([commands[0] isEqualToString:@"quit"]) {
                    break;
                } else {
                    NSLog(@"Please input a valid command");
                }
            } else {
                if (controller.score < controller.bestScore) {
                    NSLog(@"Game Over\nYou won!\nYour score: %ld", controller.score);
                    controller.bestScore = controller.score;
                    [controller reset];
                    continue;
                } else {
                    NSLog(@"Game Over\nYou lost!\nYour score: %ld", controller.score);
                    [controller reset];
                    continue;
                }
            }
        }
    }
    return 0;
}
