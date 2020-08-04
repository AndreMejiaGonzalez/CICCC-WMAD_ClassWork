//
//  Doctor.h
//  DoctorPatient
//
//  Created by Andre Mejia on 2020-04-04.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PrescriptionDatabase.h"
@class Patient;

NS_ASSUME_NONNULL_BEGIN

@interface Doctor : NSObject

@property NSMutableArray *patients;

-(void)addPatient: (Patient *)patient;

-(void)medicate: (Patient *)patient : (PrescriptionDatabase *)prescriptions;

-(void)listPrescriptions: (PrescriptionDatabase *)prescriptions forPatient:(Patient *)patient;

@end

NS_ASSUME_NONNULL_END
