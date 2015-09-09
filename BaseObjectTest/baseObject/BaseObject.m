//
//  BaseObject.m
//  BESTKEEP
//
//  Created by dcj on 15/8/27.
//  Copyright (c) 2015年 YISHANG. All rights reserved.
//

#import "BaseObject.h"
#import <objc/runtime.h>
#import <objc/objc.h>

#ifdef DEBUG
#define D_Log(...) NSLog(__VA_ARGS__)
#else
#define D_Log(...)
#endif

@interface BaseObject ()

@property (nonatomic,strong) NSMutableDictionary * unKonwnDict;


@end


@implementation BaseObject

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        obj =[self getNewValueWithNoStringValue:obj key:key];
        
       const char * name = object_getClassName(obj);
        NSLog(@"%s",name);
        
        if ([obj isKindOfClass:[NSString class]]) {
            [self setValue:obj forKey:key];
        }else{
            [self setValue:obj forUndefinedKey:key];
        }
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            <#code to be executed once#>
//        });
        
    }];
    [self.child setUnKonwnValueKeyWithDict:self.unKonwnDict];
    return self;
}

-(void)setValue:(id)value forKey:(NSString *)key{

    if ([self checkIsExistPropertyWithSender:self verifyPropertyName:key]) {
        [super setValue:value forKey:key];
    }else{
        D_Log(@"%@属性不存在\n value: %@",key,value);
        [self.unKonwnDict setObject:value forKey:key];
    }
}

-(NSMutableDictionary *)unKonwnDict{
    if (_unKonwnDict == nil) {
        _unKonwnDict = [[NSMutableDictionary alloc] init];
    }
    return _unKonwnDict;
}

//@end


//@implementation BaseObject (ParseValue)
#pragma mark -- 第一次转化
-(id)getNewValueWithNoStringValue:(id)value key:(NSString *)key{
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }else{
        if ([self canTransformToStringWithValue:value key:key]) {
            value = [value stringValue];
        }else{
            return value;
        }
    }
    return value;
}
#pragma mark -- 判断是否可以转化为字符串
-(BOOL)canTransformToStringWithValue:(id)value key:(NSString *)key{
    NSString * className = [NSString stringWithUTF8String:object_getClassName(value)];
    if ([className isEqualToString:@"__NSCFBoolean"]) {}
    else if ([className isEqualToString:@"NSDecimalNumber"]){}
    else if ([className isEqualToString:@"__NSCFNumber"]){}
    else {
        D_Log(@"key:%@ \n无法转换为string\n value:%@",key,value);
    
        return NO;
    }
    return YES;
}

@end

@implementation BaseObject (CheckIsExistProperty)

- (BOOL)checkIsExistPropertyWithSender:(id)sender verifyPropertyName:(NSString *)verifyPropertyName
{
    unsigned int outCount, i;
    objc_property_t * properties = class_copyPropertyList([sender class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property =properties[i];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        if ([propertyName isEqualToString:verifyPropertyName]) {
            free(properties);
            return YES;
        }
    }
    free(properties);
    return NO;
}


@end

@implementation BaseObject (PropertyDcitionary)

-(NSDictionary *)getPropertyDictionary{
    NSMutableDictionary * propertyDcit = [[NSMutableDictionary alloc] init];
    unsigned int outCount;
    objc_property_t * properties = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i<outCount; i++) {
        objc_property_t property = properties[i];
        NSString * propertyName = [NSString stringWithUTF8String:property_getName(property)];
        id value = [self valueForKey:propertyName];
        [propertyDcit setObject:value forKey:propertyName];
    }
    return propertyDcit;
}

@end

