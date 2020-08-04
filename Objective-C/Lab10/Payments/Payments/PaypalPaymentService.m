//
//  PaypalPaymentService.m
//  Payments
//
//  Created by Andre Mejia on 2020-04-07.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "PaypalPaymentService.h"

@implementation PaypalPaymentService

- (void)processPaymentAmount:(NSInteger)amount {
    NSLog(@"Paypal payment for %ld$ confirmed", amount);
}

- (BOOL)canProcessPayment {
    return arc4random_uniform(2);
}

@end
