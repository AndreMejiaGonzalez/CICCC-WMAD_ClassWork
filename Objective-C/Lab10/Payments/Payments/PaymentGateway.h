//
//  PaymentGateway.h
//  Payments
//
//  Created by Andre Mejia on 2020-04-07.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PaymentDelegate <NSObject>

-(void)processPaymentAmount: (NSInteger)amount;
-(BOOL)canProcessPayment;

@end

@interface PaymentGateway : NSObject

-(void)processPaymentAmount: (NSInteger)amount;
-(BOOL)canProcessPayment;

@property (nonatomic,weak) id<PaymentDelegate> paymentDelegate;

@end

NS_ASSUME_NONNULL_END
