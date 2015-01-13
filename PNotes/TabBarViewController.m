//
//  TabBarViewController.m
//  PNotes
//
//  Created by lyn on 14-12-8.
//  Copyright (c) 2014年 lyn. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    homeVC.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *home = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeVC.title = @"首页";
    
    UINavigationController *add = [[UINavigationController alloc] init];
    add.title = @"新建";
    
    UINavigationController *setting = [[UINavigationController alloc] init];
    setting.title = @"设置";
    
    [self addChildViewController:home];
    [self addChildViewController:add];
    [self addChildViewController:setting];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
