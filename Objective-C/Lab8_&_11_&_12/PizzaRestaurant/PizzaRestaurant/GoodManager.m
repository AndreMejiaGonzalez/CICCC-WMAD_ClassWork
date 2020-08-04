//
//  GoodManager.m
//  PizzaRestaurant
//
//  Created by Andre Mejia on 2020-04-09.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import "GoodManager.h"

@implementation GoodManager

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaofSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    return YES;
}

- (BOOL)kitchenDidMakePizza:(Pizza *)pizza :(DeliveryService *)service {
    NSLog(@"Enjoy the pizza!");
    [service.orders addObject:pizza];
    return YES;
}

@end
