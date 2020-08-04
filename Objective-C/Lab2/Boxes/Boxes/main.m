//
//  main.m
//  Boxes
//
//  Created by Andre Mejia on 2020-03-30.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Box *box1 = [[Box alloc]initWithHeight:50 andWidth:50 andLength:50];
        Box *box2 = [[Box alloc]initWithHeight:10 andWidth:10 andLength:10];
        NSLog(@"Box 1 has a volume of %.1f", [box1 getVolume]);
        NSLog(@"Box 2 has a volume of %.1f", [box2 getVolume]);
        NSLog(@"Box 1 fits inside Box 2 %.1f times", [box1 fitBoxInsideBox:box2]);
    }
    return 0;
}
