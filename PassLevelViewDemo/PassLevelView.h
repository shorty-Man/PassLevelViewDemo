//
//  PassLevelView.h
//  PassLevelViewDemo
//
//  Created by zhaoP on 16/9/8.
//  Copyright © 2016年 langya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PassLevelView : UIScrollView

@property (nonatomic,strong) NSArray *datas;
@property (nonatomic,copy) void (^chooseAction)(id);
@end
