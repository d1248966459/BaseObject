//
//  ViewController.m
//  BaseObjectTest
//
//  Created by dcj on 15/9/2.
//  Copyright (c) 2015年 dcj. All rights reserved.
//

#import "ViewController.h"
#import "Girl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Girl * girl = [[Girl alloc] init];
    girl.age = @"12";
    girl.name = @"girl";
    girl.gender = @"girl";
    NSDictionary * dict = [girl getPropertyDictionary];
    NSLog(@"%@",dict);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
