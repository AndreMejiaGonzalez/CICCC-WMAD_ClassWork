//
//  DelegateCook.m
//  Foodtruck
//
//  Created by Andre Mejia on 2020-04-06.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import "DelegateCook.h"

@implementation DelegateCook

- (double)foodTruck:(FoodTruck *)truck priceForFood:(NSString *)food {
    if ([food isEqualToString:@"bao"]) {
        return 13.75;
    } else if ([food isEqualToString:@"shortbread"]) {
        return 8.66;
    } else {
        return 10.0;
    }
}

@end
