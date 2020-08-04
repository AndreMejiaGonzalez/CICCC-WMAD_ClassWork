//
//  scoreKeeper.m
//  Maths
//
//  Created by Andre Mejia on 2020-03-26.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "scoreKeeper.h"

@implementation scoreKeeper

- (void) printScore {
    NSLog(@"Right Answers: %.0f, Wrong Answers: %.0f, --- %.1f%%", self.rightAnswers, self.wrongAnswers, (self.rightAnswers/self.totalAnswers) * 100);
}

@end
