//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "Pizza.h"
#import "BadManager.h"
#import "GoodManager.h"
#import "DeliveryService.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Please pick a manager\n 1: bad manager 2: good manager");
        char str[100];
        fgets(str, 100, stdin);
        NSInteger command = [[NSString stringWithUTF8String:str] intValue];
        
        Kitchen *restaurantKitchen = [[Kitchen alloc] init];
        BadManager *badManager = [[BadManager alloc] init];
        GoodManager *goodManager = [[GoodManager alloc] init];
        if (command == 1) {
            restaurantKitchen.delegate = badManager;
        } else if (command == 2) {
            restaurantKitchen.delegate = goodManager;
        } else {
            NSLog(@"input a valid manager");
            return 0;
        }
        DeliveryService *service = [[DeliveryService alloc] init];
        
        while (TRUE) {
            // Loop forever
            NSLog(@"Please pick your pizza size and toppings:");
            NSLog(@"> ");
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [[inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] lowercaseString];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            Pizza *pizza;
            PizzaSize sizeInput;
            if ([commandWords[0] isEqualToString:@"pepperoni"]) {
                pizza = [Kitchen largePepperoni];
                if ([restaurantKitchen.delegate respondsToSelector:@selector(kitchenDidMakePizza::)]) {
                    [restaurantKitchen.delegate kitchenDidMakePizza:pizza :service];
                }
                [service deliverPizza:pizza];
            } else if ([commandWords[0] isEqualToString:@"meatlovers"]) {
                if ([commandWords[1] isEqualToString:@"small"]) {
                    sizeInput = small;
                } else if ([commandWords[1] isEqualToString:@"medium"]) {
                    sizeInput = medium;
                } else if ([commandWords[1] isEqualToString:@"large"]) {
                    sizeInput = large;
                } else {
                    NSLog(@"Please input a valid pizza size:");
                    continue;
                }
                if ([restaurantKitchen.delegate kitchenShouldUpgradeOrder:restaurantKitchen]) {
                    pizza = [Kitchen meatLoversWithSize:large];
                } else {
                    pizza = [Kitchen meatLoversWithSize:sizeInput];
                }
                if ([restaurantKitchen.delegate respondsToSelector:@selector(kitchenDidMakePizza::)]) {
                    [restaurantKitchen.delegate kitchenDidMakePizza:pizza :service];
                }
                [service deliverPizza:pizza];
            } else {
                if ([commandWords[0] isEqualToString:@"small"]) {
                    sizeInput = small;
                } else if ([commandWords[0] isEqualToString:@"medium"]) {
                    sizeInput = medium;
                } else if ([commandWords[0] isEqualToString:@"large"]) {
                    sizeInput = large;
                } else {
                    NSLog(@"Please input a valid pizza size:");
                    continue;
                }
                NSArray *toppingsInput = [commandWords subarrayWithRange:NSMakeRange(1, [commandWords count] - 1)];
                if ([restaurantKitchen.delegate kitchen:restaurantKitchen shouldMakePizzaofSize:sizeInput andToppings:toppingsInput] && [restaurantKitchen.delegate kitchenShouldUpgradeOrder:restaurantKitchen]) {
                    pizza = [restaurantKitchen makePizzaWithSize:large toppings:toppingsInput];
                } else if ([restaurantKitchen.delegate kitchen:restaurantKitchen shouldMakePizzaofSize:sizeInput andToppings:toppingsInput]) {
                    pizza = [restaurantKitchen makePizzaWithSize:sizeInput toppings:toppingsInput];
                } else {
                    NSLog(@"Sorry, no Pizza");
                    return 0;
                }
                if ([restaurantKitchen.delegate respondsToSelector:@selector(kitchenDidMakePizza::)]) {
                    [restaurantKitchen.delegate kitchenDidMakePizza:pizza :service];
                }
                [service deliverPizza:pizza];
            }
            
            // output
            NSLog(@"Made pizza of size: %ld with toppings: %@", [pizza size], [pizza toppings]);
            [service printOrders];
        }

    }
    return 0;
}

