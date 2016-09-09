//
//  SingleLevelView.m
//  PassLevelViewDemo
//
//  Created by zhaoP on 16/9/8.
//  Copyright © 2016年 langya. All rights reserved.
//

#import "SingleLevelView.h"

@interface SingleLevelView ()
@property (nonatomic,strong) UIButton *content;
@end

@implementation SingleLevelView
-(instancetype)initWithFrame:(CGRect)frame{
	if (self = [super initWithFrame:frame]) {
		_content = [[UIButton alloc] initWithFrame:frame];
		[_content setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_content addTarget:self action:@selector(contentClick:) forControlEvents:UIControlEventTouchUpInside];
		self.backgroundColor = [UIColor greenColor];
		[self addSubview:_content];
	}
	return self;
}

-(void)contentClick:(id)sender{
	if (self.clickAction) {
		self.clickAction(self.data);
	}
}

-(void)setData:(id)data{
	_data = data;
	[self.content setTitle:[NSString stringWithFormat:@"%ld",[(NSNumber *)data integerValue]] forState:UIControlStateNormal];
}

@end
