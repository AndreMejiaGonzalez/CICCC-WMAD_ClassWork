//
//  Dice.m
//  Threelow
//
//  Created by Andre Mejia on 2020-04-07.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "Dice.h"

@implementation Dice

//Method generates a random number from 1 to 6 and sets the corresponding character
-(void)randomizeValue {
    NSInteger num = arc4random_uniform(6) + 1;
    switch (num) {
        case 1:
            self.value = @"⚀";
            break;
            
        case 2:
            self.value = @"⚁";
            break;
            
        case 3:
            self.value = @"⚂";
            break;
            
        case 4:
            self.value = @"⚃";
            break;
            
        case 5:
            self.value = @"⚄";
            break;
            
        case 6:
            self.value = @"⚅";
            break;
            
        default:
            break;
    }
}

@end
