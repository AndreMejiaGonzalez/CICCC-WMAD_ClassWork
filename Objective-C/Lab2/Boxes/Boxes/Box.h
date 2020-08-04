//
//  Box.h
//  Boxes
//
//  Created by Andre Mejia on 2020-03-30.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Box : NSObject

@property float height;
@property float width;
@property float length;

-(instancetype) initWithHeight: (float)height andWidth:(float)width andLength:(float) length;

-(float) getVolume;

-(float) fitBoxInsideBox: (Box *)box;

@end

NS_ASSUME_NONNULL_END
