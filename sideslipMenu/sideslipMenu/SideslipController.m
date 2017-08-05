//
//  SideslipController.m
//  sideslipMenu
//
//  Created by 刘冉 on 2017/8/4.
//  Copyright © 2017年 刘冉. All rights reserved.
//

#import "SideslipController.h"
#import "SideslipMenuView.h"
#import "LeftSideslipView.h"

static NSInteger scaleTime = 1;//view缩放的时间
static float     scaleCount = 0.8;//view的缩放倍数

@interface SideslipController ()<LeftSideslipViewDelegate,SideslipMenuViewDelegate>

/** UI */
@property (nonatomic,strong) SideslipMenuView *menuView;
/** 左侧滑出的view */
@property (nonatomic,strong) LeftSideslipView *leftView;
/** 边缘滑动手势 */
@property (nonatomic,strong) UIScreenEdgePanGestureRecognizer *leftEdageGesture;
@end

@implementation SideslipController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.menuView];
    [self.view insertSubview:self.leftView belowSubview:self.menuView];
    //添加边缘手势
    [self addPanGenesture];
}

#pragma mark - 添加滑动手势
-(void)addPanGenesture{
    self.leftEdageGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(panGeneture:)];
    self.leftEdageGesture.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:self.leftEdageGesture];
}

-(void)panGeneture:(UIScreenEdgePanGestureRecognizer*)sender{
    CGPoint transtion = [sender translationInView:self.view];
    self.leftView.hidden = NO;
    [UIView animateWithDuration:scaleTime delay:0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        self.leftView.x = transtion.x > kScreenW/2 ? 0 : -kScreenW/2 + transtion.x;
    } completion:nil];
    //手势滑动距离未超过一半时停止
    if (transtion.x < kScreenW/2 && sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:scaleTime delay:0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            self.leftView.x = 0;
        } completion:nil];
    }
    //手势滑动距离超过一半
    [UIView animateWithDuration:scaleTime delay:0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        CGAffineTransform scale = CGAffineTransformMakeScale(scaleCount, scaleCount);
        CGAffineTransform move = CGAffineTransformMakeTranslation(self.leftView.x + kScreenW/2 - kScreenW*(1-scaleCount), 0);
        self.menuView.transform = CGAffineTransformConcat(move, scale);
    } completion:nil];
}

#pragma mark - LeftSideslipViewDelegate
-(void)backToOldPostion:(id)sender{
    //复位动画
    [UIView animateWithDuration:0.3 animations:^{
        CGAffineTransform scale = CGAffineTransformMakeScale(1, 1);
        CGAffineTransform move = CGAffineTransformMakeTranslation(0, 0);
        self.menuView.transform = CGAffineTransformConcat(scale, move);
    }];
}

#pragma mark - SideslipMenuViewDelegate
-(void)selectCell:(NSIndexPath *)selectIndex{
    switch (selectIndex.row) {
        case 0:{
            self.leftView.hidden = NO;
            [UIView animateWithDuration:scaleTime delay:0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                self.leftView.x = 0;
                CGAffineTransform scale = CGAffineTransformMakeScale(scaleCount, scaleCount);
                CGAffineTransform move = CGAffineTransformMakeTranslation(self.leftView.x + kScreenW/2 - kScreenW*(1-scaleCount), 0);
                self.menuView.transform = CGAffineTransformConcat(move, scale);
            } completion:nil];
        }
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        default:
            break;
    }
}

-(SideslipMenuView *)menuView{
    if (!_menuView) {
        _menuView = [[SideslipMenuView alloc] initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH - 64)];
        _menuView.delegate = self;
    }
    return _menuView;
}

-(LeftSideslipView *)leftView{
    if (!_leftView) {
        _leftView = [[LeftSideslipView alloc] initWithFrame:CGRectMake(-kScreenW/2, 0, kScreenW/2, kScreenH)];
        _leftView.delegate = self;
    }
    return _leftView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
