//
//  Dice.h
//  Threelow
//
//  Created by Andre Mejia on 2020-04-07.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject

//NSString that holds the value as a unicode character: ⚀ ⚁ ⚂ ⚃ ⚄ ⚅
@property NSString *value;

-(void)randomizeValue;

@end

NS_ASSUME_NONNULL_END
