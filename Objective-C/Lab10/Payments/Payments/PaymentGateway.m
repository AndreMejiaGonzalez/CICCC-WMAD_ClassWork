//
//  PaymentGateway.m
//  Payments
//
//  Created by Andre Mejia on 2020-04-07.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "PaymentGateway.h"

@implementation PaymentGateway

- (void)processPaymentAmount:(NSInteger)amount {
    [self.paymentDelegate processPaymentAmount:amount];
}

- (BOOL)canProcessPayment {
    return [self.paymentDelegate canProcessPayment];
}

@end
