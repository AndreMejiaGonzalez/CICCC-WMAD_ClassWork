//
//  Patient.m
//  DoctorPatient
//
//  Created by Andre Mejia on 2020-04-04.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (instancetype)initWithName:(NSString *)name Age:(NSInteger)age Height:(float)height Weight:(float)weight AndSymptoms:(NSArray *)symptoms {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _height = height;
        _weight = weight;
        _symptoms = symptoms;
        _treated = false;
    }
    return self;
}

- (void)visitDoctor:(Doctor *)doctor {
    [doctor addPatient:self];
}

- (void)requestMedication:(Doctor *)doctor : (PrescriptionDatabase *)prescriptions {
    if ([doctor.patients containsObject:self]) {
        [doctor medicate:self :prescriptions];
    } else {
        NSLog(@"%@ is not a patient of this doctor", self.name);
    }
}

@end
