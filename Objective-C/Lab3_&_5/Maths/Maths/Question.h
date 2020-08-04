//
//  AdditionQuestion.h
//  Maths
//
//  Created by Andre Mejia on 2020-03-26.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Question : NSObject

@property NSString *question;
@property (nonatomic) NSInteger answer;
@property NSDate *startTime;
@property NSDate *endTime;
@property NSInteger left;
@property NSInteger right;

-(NSTimeInterval) answerTime;

-(void) generateQestion;

@end

NS_ASSUME_NONNULL_END
