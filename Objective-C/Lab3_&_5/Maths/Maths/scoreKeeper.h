//
//  scoreKeeper.h
//  Maths
//
//  Created by Andre Mejia on 2020-03-26.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface scoreKeeper : NSObject

@property float rightAnswers;
@property float wrongAnswers;
@property float totalAnswers;

- (void) printScore;

@end

NS_ASSUME_NONNULL_END
