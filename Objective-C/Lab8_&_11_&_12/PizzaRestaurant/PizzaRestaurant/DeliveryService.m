//
//  DeliveryService.m
//  PizzaRestaurant
//
//  Created by Andre Mejia on 2020-04-09.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import "DeliveryService.h"

@implementation DeliveryService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _orders = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)deliverPizza:(Pizza *)pizza {
    [DeliveryCar deliverPizza];
}

- (void)printOrders {
    for (Pizza *pizza in self.orders) {
        NSLog(@"Pizza of size: %ld, and toppings %@", pizza.size, pizza.toppings);
    }
}

@end
