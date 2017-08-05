//
//  UIView+Frame.h
//  sideslipMenu
//
//  Created by 刘冉 on 2017/8/4.
//  Copyright © 2017年 刘冉. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  重写系统的UIView的frame下各个属性的set,get方法,方便直接修改视图的位置和大小
 */

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat  x;
@property (nonatomic, assign) CGFloat  y;
@property (nonatomic, assign) CGFloat  width;
@property (nonatomic, assign) CGFloat  height;

@property (nonatomic, assign) CGFloat  maxX;
@property (nonatomic, assign) CGFloat  centerX;

@property (nonatomic, assign) CGFloat  maxY;
@property (nonatomic, assign) CGFloat  centerY;
@property (nonatomic, assign) CGPoint  origin;
@property (nonatomic, assign) CGSize  size;

/**
 *  移除子视图
 */
-(void)removeAllSubview;

@end
