//
//  StripePaymentService.m
//  Payments
//
//  Created by Andre Mejia on 2020-04-07.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "StripePaymentService.h"

@implementation StripePaymentService

- (void)processPaymentAmount:(NSInteger)amount {
    NSLog(@"Stripe payment for %ld$ confirmed", amount);
}

- (BOOL)canProcessPayment {
    return arc4random_uniform(2);
}

@end
