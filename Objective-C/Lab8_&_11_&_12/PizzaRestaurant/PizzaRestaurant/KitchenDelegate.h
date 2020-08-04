//
//  KitchenDelegate.h
//  PizzaRestaurant
//
//  Created by Andre Mejia on 2020-04-09.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"
#import "DeliveryService.h"
@class Kitchen;

NS_ASSUME_NONNULL_BEGIN

@protocol KitchenDelegate <NSObject>

-(BOOL)kitchen: (Kitchen *)kitchen shouldMakePizzaofSize: (PizzaSize)size andToppings:(NSArray *)toppings;

-(BOOL)kitchenShouldUpgradeOrder: (Kitchen *)kitchen;

@optional
-(BOOL)kitchenDidMakePizza: (Pizza *)pizza :(DeliveryService *)service;

@end

@interface KitchenDelegate : NSObject

@end

NS_ASSUME_NONNULL_END
