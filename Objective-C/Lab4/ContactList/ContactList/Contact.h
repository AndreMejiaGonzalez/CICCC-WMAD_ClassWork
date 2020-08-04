//
//  Contact.h
//  ContactList
//
//  Created by Andre Mejia on 2020-04-03.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject

@property NSString *name;
@property NSString *email;
@property NSMutableDictionary *numbers;

@end

NS_ASSUME_NONNULL_END
