//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by Andre Mejia on 2020-03-31.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, PizzaSize) {
    small, medium, large
};

@interface Pizza : NSObject

@property NSArray *toppings;

@property PizzaSize size;

-(instancetype)initWithSize: (PizzaSize)size AndToppings: (NSArray *)toppings;

@end

NS_ASSUME_NONNULL_END
