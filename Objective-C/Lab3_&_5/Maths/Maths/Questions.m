//
//  AdditionQuestion.m
//  Maths
//
//  Created by Andre Mejia on 2020-03-26.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype)init
{
    self = [super init];
    if (self) {
        _startTime = [NSDate date];
        _left = arc4random_uniform(101);
        _right = arc4random_uniform(101);
    }
    return self;
}

- (NSInteger)answer {
    _endTime = [NSDate date];
    return _answer;
}

- (NSTimeInterval)answerTime {
    NSTimeInterval interval = [self.endTime timeIntervalSinceDate:self.startTime];
    return interval;
}

- (void)generateQestion {
    
}

@end
