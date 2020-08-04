//
//  BadManager.m
//  PizzaRestaurant
//
//  Created by Andre Mejia on 2020-04-09.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import "BadManager.h"

@implementation BadManager

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaofSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    if ([toppings containsObject:@"anchovies"]) {
        return NO;
    }
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(nonnull Kitchen *)kitchen {
    return NO;
}

- (BOOL)kitchenDidMakePizza:(Pizza *)pizza :(DeliveryService *)service {
    [service.orders addObject:pizza];
    return YES;
}


@end
