//
//  GameController.h
//  Threelow
//
//  Created by Andre Mejia on 2020-04-07.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property NSMutableArray *dice;
@property NSMutableArray *heldDice;
@property (nonatomic) NSString *diceString;
@property (nonatomic) NSString *heldString;
@property (nonatomic) NSInteger score;
@property NSInteger rolls;
@property NSInteger bestScore;

-(void)rollDice: (NSMutableArray *)dice;

-(void)holdDie: (NSInteger)index;

-(void)unHoldDie: (NSInteger)index;

-(void)reset;

-(void)printStatus;

@end

NS_ASSUME_NONNULL_END
