//
//  LeftSideslipView.m
//  sideslipMenu
//
//  Created by 刘冉 on 2017/8/4.
//  Copyright © 2017年 刘冉. All rights reserved.
//

#import "LeftSideslipView.h"

@implementation LeftSideslipView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        self.hidden = YES;
        [self addGensture];
    }
    return self;
}

#pragma mark - 添加返回手势
-(void)addGensture{
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchLeftView:)];
    [self addGestureRecognizer:tap];
}

-(void)touchLeftView:(UITapGestureRecognizer*)sender{
    if ([self.delegate respondsToSelector:@selector(backToOldPostion:)]) {
        [self leftDismiss];
        [self.delegate backToOldPostion:self];
    }
}

#pragma mark - 左移页面的消失
-(void)leftDismiss{
    [UIView animateWithDuration:0.3 animations:^{
//        self.backgroundColor = [UIColor clearColor];
        self.x = -kScreenW/2;
    } completion:^(BOOL finished) {
        self.hidden = YES;
//        self.isShow ? : self.leftViewDismiss();
    }];
}
@end
