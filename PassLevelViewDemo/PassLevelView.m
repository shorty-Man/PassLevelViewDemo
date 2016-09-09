//
//  PassLevelView.m
//  PassLevelViewDemo
//
//  Created by zhaoP on 16/9/8.
//  Copyright © 2016年 langya. All rights reserved.
//

#import "PassLevelView.h"
#import "SingleLevelView.h"
#define kColumnCount 4

@interface PassLevelView ()
@property (nonatomic,strong) NSMutableArray *allPoints;
@end

@implementation PassLevelView
-(instancetype)initWithFrame:(CGRect)frame{
	if (self = [super initWithFrame:frame]) {
		self.bounces = NO;
		self.showsVerticalScrollIndicator = NO;
	}
	return self;
}

-(NSMutableArray *)allPoints{
	if (!_allPoints) {
		_allPoints = [NSMutableArray array];
	}
	return _allPoints;
}

-(void)setDatas:(NSArray *)datas{
	[self.allPoints removeAllObjects];
//	CGFloat leftSpace;//左右间距,暂且认为和itemSpace相等
	CGFloat itemSpace;//item之间的间距
	itemSpace = self.frame.size.width / ((kColumnCount - 1) * 0.707 + 2);
	
	//最下面的点从左边开始
	CGFloat contentSizeH = ((datas.count - 1) * 0.707 + 2) * itemSpace;
	self.contentSize = CGSizeMake(self.frame.size.width, contentSizeH);
	self.contentOffset = CGPointMake(0, contentSizeH - self.frame.size.height);
	CGPoint currentPoint = CGPointMake(itemSpace, contentSizeH - itemSpace);
	CGFloat singleViewX = currentPoint.x;
	CGFloat singleViewY = currentPoint.y;
	for (int index = 0; index < datas.count; index++) {
		if (index > 0) {
			
			
			singleViewX = currentPoint.x + ([self isEvenNumber:(index - 1) / (kColumnCount  -1)] ? 0.707 * itemSpace : (-0.707 *itemSpace));
			singleViewY = currentPoint.y - 0.707 * itemSpace;
		}
		currentPoint = CGPointMake(singleViewX, singleViewY);
		SingleLevelView *singleView = [[SingleLevelView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
		singleView.center = currentPoint;
		singleView.data = datas[index];
		singleView.clickAction = ^(id data){
			if (self.chooseAction) {
				self.chooseAction(data);
			}
		};
		[self addSubview:singleView];
		[self.allPoints addObject:[NSValue valueWithCGPoint:currentPoint]];
	}
}

//偶数往右走，奇数往左走
-(BOOL)isEvenNumber:(int)number{
	return number % 2 == 0;
}

@end
