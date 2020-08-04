//
//  Box.m
//  Boxes
//
//  Created by Andre Mejia on 2020-03-30.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import "Box.h"

@implementation Box

- (instancetype)initWithHeight:(float)height andWidth:(float)width andLength:(float)length {
    self = [super init];
    if (self) {
        _height = height;
        _width = width;
        _length = length;
    }
    return self;
}

- (float)getVolume {
    float res = self.width * self.length * self.height;
    return res;
}

- (float)fitBoxInsideBox:(Box *)box {
    float res = [self getVolume] / [box getVolume];
    return res;
}

@end
