//
//  main.m
//  Maths
//
//  Created by Andre Mejia on 2020-03-26.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"
#import "inputHandler.h"
#import "scoreKeeper.h"
#import "questionManager.h"
#import "QuestionFactory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        scoreKeeper *score = [[scoreKeeper alloc] init];
        questionManager *manager = [[questionManager alloc] init];
        QuestionFactory *factory = [[QuestionFactory alloc] init];
        NSLog(@"MATHS! input 'q' to quit");
        BOOL gameOn = YES;
        while (gameOn) {
            Question *q = [factory generateRandomQuestion];
            NSLog(@"%@", q.question);
            NSString *inputString = [inputHandler getInput];
            if (![inputString isEqualToString:@"q"]) {
                NSInteger answer = [inputString intValue];
                if (answer == q.answer) {
                    [manager.questions addObject:q];
                    NSLog(@"Right!");
                    score.rightAnswers += 1;
                    score.totalAnswers += 1;
                    [score printScore];
                    NSLog(@"%@", [manager timeOutput]);
                } else {
                    [manager.questions addObject:q];
                    NSLog(@"Wrong!");
                    score.wrongAnswers += 1;
                    score.totalAnswers += 1;
                    [score printScore];
                    NSLog(@"%@", [manager timeOutput]);
                }
            } else {
                gameOn = NO;
                break;
            }
        }
    }
    return 0;
}
