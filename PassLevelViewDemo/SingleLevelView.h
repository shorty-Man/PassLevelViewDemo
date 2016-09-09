//
//  SingleLevelView.h
//  PassLevelViewDemo
//
//  Created by zhaoP on 16/9/8.
//  Copyright © 2016年 langya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleLevelView : UIView
@property (nonatomic,strong) id data;
@property (nonatomic,copy) void (^clickAction)(id);
@end
