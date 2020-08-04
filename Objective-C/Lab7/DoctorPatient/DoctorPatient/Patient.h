//
//  Patient.h
//  DoctorPatient
//
//  Created by Andre Mejia on 2020-04-04.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "PrescriptionDatabase.h"

NS_ASSUME_NONNULL_BEGIN

@interface Patient : NSObject

@property NSString *name;
@property NSInteger age;
@property float height;
@property float weight;
@property NSArray *symptoms;
@property BOOL treated;

-(instancetype)initWithName: (NSString *)name Age:(NSInteger)age Height:(float)height Weight:(float)weight AndSymptoms:(NSArray *)symptoms;

-(void)visitDoctor: (Doctor *)doctor;

-(void)requestMedication: (Doctor *)doctor : (PrescriptionDatabase *)prescriptions;

@end

NS_ASSUME_NONNULL_END
