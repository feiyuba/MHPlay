//
//  ViewController.m
//  MHPlayer
//
//  Created by 飞鱼 on 2017/12/28.
//  Copyright © 2017年 马浩. All rights reserved.
//

#import "ViewController.h"
#import "AFAppDotNetAPIClient.h"
#import "AssignToObject.h"
#import "Model.h"
#import "TopModel.h"
#import "MHTableViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import "CLPlayerView.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *aTableView;
@property (nonatomic, copy  ) NSMutableArray *modelArr;
@property (nonatomic, strong) MHTableViewCell *cell;
@property (nonatomic, strong) CLPlayerView *playerView;
@property (nonatomic, strong) Model *model;

@end

@implementation ViewController

#pragma mark -- 需要页面支持其他方向，需要重写这三个方法，默认所有页面只支持竖屏
// 是否支持自动转屏
- (BOOL)shouldAutorotate {
    return YES;
}
// 支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}
// 默认的屏幕方向（当前ViewController必须是通过模态出来的UIViewController（模态带导航的无效）方式展现出来的，才会调用这个方法）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (UITableView *)aTableView
{
    if (!_aTableView)
    {
        _aTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
        _aTableView.delegate = self;
        _aTableView.dataSource = self;
        _aTableView.tableFooterView = [UIView new];
        _aTableView.rowHeight = 60+375*9/16;
        [_aTableView registerClass:[MHTableViewCell class] forCellReuseIdentifier:@"reuse"];
        [self.view addSubview:_aTableView];
        
    }
    return _aTableView;
}

- (void)getdate
{
    [AFAppDotNetAPIClient GET:@"http://c.m.163.com/nc/video/home/0-10.html" parameters:nil returnData:^(NSData *resultData, NSError *error) {
        if (resultData)
        {
            // NSLog(@"%@", resultData);
            NSArray *arr = [(NSDictionary *)resultData objectForKey:@"videoList"];
            NSLog(@"%@", arr);
            self.modelArr = [AssignToObject customModel:@"Model" ToArray:arr];
            [self.aTableView reloadData];
        }
        else
        {
            NSLog(@"%@", error);
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    _modelArr = [NSMutableArray array];
    [self getdate];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    Model *model = _modelArr[indexPath.row];
    
    NSArray *arr = model.videoTopic;
    __weak typeof(self)weakSelf = self;
    __weak typeof(cell)weakCell = cell;
    
    //    _cell = [[MHTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
    [cell setModel:model andTopArr:arr];
    
    cell.playerBlock = ^{
        [weakSelf cl_tableViewCellPlayVideoWithCell:weakCell andUrl:model.m3u8_url];
    };
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - 点击播放代理
- (void)cl_tableViewCellPlayVideoWithCell:(MHTableViewCell *)cell andUrl:(NSString *)url{
    //记录被点击的Cell
    _cell = cell;
    //销毁播放器
    [_playerView destroyPlayer];
    CLPlayerView *playerView = [[CLPlayerView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height-60)];
    _playerView = playerView;
    [cell.contentView addSubview:_playerView];
    //    //重复播放，默认不播放
    //    _playerView.repeatPlay = YES;
    //    //当前控制器是否支持旋转，当前页面支持旋转的时候需要设置，告知播放器
    _playerView.isLandscape = YES;
    //    //设置等比例全屏拉伸，多余部分会被剪切
    //    _playerView.fillMode = ResizeAspectFill;
    //    //设置进度条背景颜色
    //    _playerView.progressBackgroundColor = [UIColor purpleColor];
    //    //设置进度条缓冲颜色
    //    _playerView.progressBufferColor = [UIColor redColor];
    //    //设置进度条播放完成颜色
    //    _playerView.progressPlayFinishColor = [UIColor greenColor];
    //    //全屏是否隐藏状态栏
    //    _playerView.fullStatusBarHidden = NO;
    //    //转子颜色
    //    _playerView.strokeColor = [UIColor redColor];
    //视频地址
    _playerView.url = [NSURL URLWithString:url];
    //播放
    [_playerView playVideo];
    //返回按钮点击事件回调
    [_playerView backButton:^(UIButton *button) {
        NSLog(@"返回按钮被点击");
    }];
    //播放完成回调
    [_playerView endPlay:^{
        //销毁播放器
        [_playerView destroyPlayer];
        _playerView = nil;
        _cell = nil;
        NSLog(@"播放完成");
    }];
}

//cell离开tableView时调用
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //因为复用，同一个cell可能会走多次
    if ([_cell isEqual:cell]) {
        //区分是否是播放器所在cell,销毁时将指针置空
        [_playerView destroyPlayer];
        _cell = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
