//
//  BaseObject.h
//  BESTKEEP
//
//  Created by dcj on 15/8/27.
//  Copyright (c) 2015年 YISHANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SetUknownValueKey <NSObject>

-(void)setUnKonwnValueKeyWithDict:(NSDictionary *)unKonwnDict;

@end


@interface BaseObject : NSObject
/**
 *
 */
@property (nonatomic,weak) BaseObject <SetUknownValueKey> *child;

-(instancetype)initWithDictionary:(NSDictionary *)dict;

@end


@interface BaseObject (CheckIsExistProperty)

/**
 *  检查是否具有某个属性
 *
 *  @param sender             被检查对象
 *  @param verifyPropertyName 属性名字
 *
 *  @return 结果
 */

- (BOOL)checkIsExistPropertyWithSender:(id)sender verifyPropertyName:(NSString *)verifyPropertyName;

@end

@interface BaseObject (PropertyDcitionary)
/**
 *  模型转字典
 *
 *  @return 属性字典
 */
-(NSDictionary *)getPropertyDictionary;

@end


