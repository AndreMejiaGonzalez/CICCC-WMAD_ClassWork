//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"
#import "Pizza.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings
{
    Pizza *pizza = [[Pizza alloc] initWithSize:size AndToppings:toppings];
    return pizza;
}

+ (Pizza *)largePepperoni {
    NSArray *toppings = @[@"cheese", @"pepperoni"];
    Pizza *pizza = [[Pizza alloc] initWithSize:large AndToppings:toppings];
    return pizza;
}

+ (Pizza *)meatLoversWithSize:(PizzaSize)size {
    NSArray *toppings = @[@"cheese", @"sausage", @"bacon", @"ham"];
    Pizza *pizza = [[Pizza alloc] initWithSize:size AndToppings:toppings];
    return pizza;
}

@end
