//
//  SideslipMenuView.h
//  sideslipMenu
//
//  Created by 刘冉 on 2017/8/4.
//  Copyright © 2017年 刘冉. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SideslipMenuViewDelegate <NSObject>

/**
 * 点击cell的回调方法
 */
-(void)selectCell:(NSIndexPath*)selectIndex;

@end

@interface SideslipMenuView : UIView

/** delegate */
@property (nonatomic,weak) id<SideslipMenuViewDelegate> delegate;

@end
