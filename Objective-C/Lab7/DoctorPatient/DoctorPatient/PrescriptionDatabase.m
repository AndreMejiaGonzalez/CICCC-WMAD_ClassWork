//
//  PrescriptionDatabase.m
//  DoctorPatient
//
//  Created by Andre Mejia on 2020-04-04.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "PrescriptionDatabase.h"

@implementation PrescriptionDatabase

- (instancetype)init
{
    self = [super init];
    if (self) {
        _prescriptions = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end
