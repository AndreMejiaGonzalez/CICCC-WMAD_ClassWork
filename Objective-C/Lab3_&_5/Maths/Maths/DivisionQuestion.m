//
//  DivitionQuestions.m
//  Maths
//
//  Created by Andre Mejia on 2020-03-27.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "DivisionQuestion.h"

@implementation DivisionQuestion

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self generateQestion];
    }
    return self;
}

- (void)generateQestion {
    super.question = [NSString stringWithFormat:@"Qestion: %ld / %ld?",super.left,super.right];
    super.answer = super.left / super.right;
}

@end
