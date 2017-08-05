//
//  SideslipMenuView.m
//  sideslipMenu
//
//  Created by 刘冉 on 2017/8/4.
//  Copyright © 2017年 刘冉. All rights reserved.
//

#import "SideslipMenuView.h"

static NSString* cellID = @"cell";

@interface SideslipMenuView ()<UITableViewDelegate,UITableViewDataSource>

/** 界面UI */
@property (nonatomic,strong) UITableView *tableView;
/** dataSource */
@property (nonatomic,strong) NSArray *dataSource;

@end

@implementation SideslipMenuView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.dataSource = @[@"左滑",@"右滑",@"item3"];
        [self addSubview:self.tableView];
    }
    return self;
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(selectCell:)]) {
        [self.delegate selectCell:indexPath];
    }
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, CGRectGetHeight(self.bounds)) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor cyanColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
