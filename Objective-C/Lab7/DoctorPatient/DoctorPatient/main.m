//
//  main.m
//  DoctorPatient
//
//  Created by Andre Mejia on 2020-04-04.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
#import "Doctor.h"
#import "PrescriptionDatabase.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //initializing prescription database and doctor instance
        PrescriptionDatabase *database = [[PrescriptionDatabase alloc] init];
        Doctor *doctor = [[Doctor alloc] init];
        
        //initializing patients
        Patient *patient1 = [[Patient alloc] initWithName:@"Jhon Doe" Age:25 Height:6.3 Weight:120 AndSymptoms:@[@"Sore Throat", @"Headache"]];
        Patient *patient2 = [[Patient alloc] initWithName:@"Jane Doe" Age:25 Height:6.3 Weight:120 AndSymptoms:@[@"Sore Throat", @"Headache"]];
        
        //adding patient to doctor's patient list
        [patient1 visitDoctor:doctor];
        
        //calling request medication with patient in patient list
        [patient1 requestMedication:doctor :database];
        
        //listing prescriptions of first patient
        [doctor listPrescriptions:database forPatient:patient1];
        
        //calling request medication with patient NOT in patient list
        [patient2 requestMedication:doctor :database];
        
    }
    return 0;
}
