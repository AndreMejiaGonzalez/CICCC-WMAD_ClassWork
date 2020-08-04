//
//  main.m
//  Payments
//
//  Created by Andre Mejia on 2020-04-07.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"
#import "PaypalPaymentService.h"
#import "StripePaymentService.h"
#import "AmazonPaymentService.h"
#import "ApplePaymentService.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger dollarValue = arc4random_uniform(901) + 100;
        NSLog(@"\nThank you for shopping at Acme.com\nYour total today is %ld$\nPlease select your payment method:\n1:Paypal, 2:Stripe, 3:Amazon 4:ApplePay", dollarValue);
        char inputchar[255];
        fgets(inputchar, 255, stdin);
        NSInteger inputCommand = [[[NSString stringWithUTF8String:inputchar] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] integerValue];
        PaymentGateway *gateway = [[PaymentGateway alloc] init];
        PaypalPaymentService *paypal = [[PaypalPaymentService alloc] init];
        StripePaymentService *stripe = [[StripePaymentService alloc] init];
        AmazonPaymentService *amazon = [[AmazonPaymentService alloc] init];
        ApplePaymentService *apple = [[ApplePaymentService alloc] init];
        switch (inputCommand) {
            case 1:
                gateway.paymentDelegate = paypal;
                break;
                
            case 2:
                gateway.paymentDelegate = stripe;
                break;
                
            case 3:
                gateway.paymentDelegate = amazon;
                break;
                
            case 4:
                gateway.paymentDelegate = apple;
                break;
                
            default:
                NSLog(@"Please Input a Valid Command");
                break;
        }
        if ([gateway canProcessPayment]) {
            [gateway processPaymentAmount:dollarValue];
        } else {
            NSLog(@"Cannot currently process the payment, sorry for the inconvinience");
        }
    }
    return 0;
}
