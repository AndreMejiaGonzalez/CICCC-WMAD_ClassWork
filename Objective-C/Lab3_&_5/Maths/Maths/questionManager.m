//
//  questionManager.m
//  Maths
//
//  Created by Andre Mejia on 2020-03-26.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "questionManager.h"
#import "Question.h"

@implementation questionManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _questions = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)timeOutput {
    double totalTime = 0;
    double averageTime = 0;
    for (int i = 0; i < self.questions.count; i++) {
        totalTime += [self.questions[i] answerTime];
    }
    averageTime = totalTime / self.questions.count;
    NSString *output = [NSString stringWithFormat:@"Total Time: %.0fs, Average Time: %.0fs", totalTime, averageTime];
    return output;
}

@end
