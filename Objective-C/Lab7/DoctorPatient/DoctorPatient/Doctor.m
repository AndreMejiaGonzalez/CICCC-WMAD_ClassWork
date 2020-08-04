//
//  Doctor.m
//  DoctorPatient
//
//  Created by Andre Mejia on 2020-04-04.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"

@implementation Doctor

- (instancetype)init
{
    self = [super init];
    if (self) {
        _patients = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addPatient:(Patient *)patient {
    [self.patients addObject:patient];
}

- (void)medicate:(Patient *)patient :(PrescriptionDatabase *)prescriptions {
    patient.treated = true;
    [prescriptions.prescriptions setObject:@"some medication" forKey:patient.name];
}

- (void)listPrescriptions:(PrescriptionDatabase *)prescriptions forPatient:(Patient *)patient {
    for (NSString * key in prescriptions.prescriptions) {
        if ([key isEqualToString:patient.name]) {
            NSLog(@"%@ : %@", key, [prescriptions.prescriptions objectForKey:key]);
        }
    }
}

@end
