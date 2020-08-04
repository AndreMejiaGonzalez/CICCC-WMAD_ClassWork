//
//  DeliveryService.h
//  PizzaRestaurant
//
//  Created by Andre Mejia on 2020-04-09.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"
#import "DeliveryCar.h"

NS_ASSUME_NONNULL_BEGIN

@interface DeliveryService : NSObject

@property NSMutableArray *orders;

-(void)deliverPizza:(Pizza *)pizza;

-(void)printOrders;

@end

NS_ASSUME_NONNULL_END
