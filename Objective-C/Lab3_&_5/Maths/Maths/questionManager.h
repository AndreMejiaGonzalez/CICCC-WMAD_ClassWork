//
//  questionManager.h
//  Maths
//
//  Created by Andre Mejia on 2020-03-26.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface questionManager : NSObject

@property NSMutableArray *questions;

- (NSString *) timeOutput;

@end

NS_ASSUME_NONNULL_END
