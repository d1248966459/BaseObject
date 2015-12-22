//
//  User.h
//  BaseObjectTest
//
//  Created by dcj on 15/12/22.
//  Copyright © 2015年 dcj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "baseObject/BaseObject.h"

@interface User : BaseObject
@property (nonatomic,copy)NSString * name;
@property (nonatomic,copy)NSString * age;

@end
