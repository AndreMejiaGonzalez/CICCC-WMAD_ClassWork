//
//  ApplePaymentService.m
//  Payments
//
//  Created by Andre Mejia on 2020-04-07.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "ApplePaymentService.h"

@implementation ApplePaymentService

- (void)processPaymentAmount:(NSInteger)amount {
    NSLog(@"ApplePay payment for %ld$ confirmed", amount);
}

- (BOOL)canProcessPayment {
    return arc4random_uniform(2);
}

@end
