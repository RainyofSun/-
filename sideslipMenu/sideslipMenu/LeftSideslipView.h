//
//  LeftSideslipView.h
//  sideslipMenu
//
//  Created by 刘冉 on 2017/8/4.
//  Copyright © 2017年 刘冉. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftSideslipViewDelegate <NSObject>

/**
 * 点击弹出页面进行复位
 */
-(void)backToOldPostion:(id)sender;

@end

@interface LeftSideslipView : UIView

/**<标记view是否显现>*/
@property (nonatomic,assign) BOOL isShow;
/**<view消失后的操作>*/
@property (nonatomic,copy) void(^leftViewDismiss)();
/**<delegate>*/
@property (nonatomic,weak) id<LeftSideslipViewDelegate> delegate;

@end
