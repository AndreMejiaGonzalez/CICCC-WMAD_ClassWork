//
//  QuestionFactory.m
//  Maths
//
//  Created by Andre Mejia on 2020-03-27.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "QuestionFactory.h"
#import "Question.h"

@implementation QuestionFactory

- (instancetype)init
{
    self = [super init];
    if (self) {
        _questionTpes = @[@"AdditionQuestion", @"SubstractionQuestion", @"MultiplicationQuestion", @"DivisionQuestion"];
    }
    return self;
}

- (Question *) generateRandomQuestion {
    NSInteger a = arc4random_uniform(4);
    Question *questionObject = [[NSClassFromString(self.questionTpes[a]) alloc] init];
    return questionObject;
}

@end
