//
//  ViewController.m
//  PassLevelViewDemo
//
//  Created by zhaoP on 16/9/8.
//  Copyright © 2016年 langya. All rights reserved.
//

#import "ViewController.h"
#import "PassLevelView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	PassLevelView *passView = [[PassLevelView alloc] initWithFrame:self.view.frame];
	passView.chooseAction = ^(id data){
		NSLog(@"%ld",[(NSNumber *)data integerValue]);
	};
	passView.datas = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15];
	[self.view addSubview:passView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
