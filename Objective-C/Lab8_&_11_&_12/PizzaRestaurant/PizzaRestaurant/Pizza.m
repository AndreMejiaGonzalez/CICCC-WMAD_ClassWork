//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by Andre Mejia on 2020-03-31.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

- (instancetype)initWithSize:(PizzaSize)size AndToppings:(NSArray *)toppings {
    self = [super init];
    if (self) {
        _size = size;
        _toppings = toppings;
    }
    return self;
}

@end
