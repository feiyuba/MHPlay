//
//  MHTableViewCell.m
//  MHPlayer
//
//  Created by 飞鱼 on 2017/12/28.
//  Copyright © 2017年 马浩. All rights reserved.
//

#import "MHTableViewCell.h"
#import "Model.h"
#import "UIImageView+WebCache.h"

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@implementation MHTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _imgView = [[UIImageView alloc] initWithFrame:self.frame];
        [self.contentView addSubview:_imgView];
        _imgView.userInteractionEnabled = YES;
        [_imgView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.top.equalTo(0);
            make.width.equalTo(self.width);
            make.height.equalTo(375*9/16);
        }];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(play)];
        [_imgView addGestureRecognizer:tap];
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.top.equalTo(_imgView.bottom);
            make.width.equalTo(_imgView.width);
            make.height.equalTo(60);
        }];
        
        _length = [[UILabel alloc] init];
        _length.textColor = [UIColor whiteColor];
        _length.font = [UIFont systemFontOfSize:13];
        _length.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_length];
        [_length makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.bottom.equalTo(view.top).offset(-10);
            make.width.equalTo(60);
        }];
        
        _playCount = [[UILabel alloc] init];
        _playCount.textColor = [UIColor whiteColor];
        _playCount.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_playCount];
        [_playCount makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.equalTo(_length.bottom);
            make.width.equalTo(120);
        }];
        
        UILabel *label = [[UILabel alloc] init];
        label.text = @"来自:";
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor blackColor];
        [view addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(view.centerY);
            make.width.equalTo(40);
            make.left.equalTo(10);
        }];
        
        _userIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:_userIcon];
        _userIcon.layer.masksToBounds = YES;
        _userIcon.layer.cornerRadius = 18;
        [_userIcon makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label.right);
            make.centerY.equalTo(view.centerY);
            make.width.height.equalTo(36);
        }];
        
        _tName = [[UILabel alloc] init];
        _tName.textColor = [UIColor grayColor];
        _tName.font = [UIFont systemFontOfSize:13];
        _tName.textColor = [UIColor colorWithRed:117/255.0 green:208/255.0 blue:56/255.0 alpha:1];
        [view addSubview:_tName];
        [_tName makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(view.centerY);
            make.left.equalTo(_userIcon.right).offset(5);
            make.width.equalTo(120);
            make.height.equalTo(20);
        }];
        
        _title = [[UILabel alloc] init];
        _title.textColor = [UIColor whiteColor];
        _title.font = [UIFont boldSystemFontOfSize:16];
        _title.numberOfLines = 0;
        [self.contentView addSubview:_title];
        [_title makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.width.equalTo(SCREENWIDTH - 20);
            make.height.equalTo(60);
            make.top.equalTo(0);
        }];
        
        _aTime = [[UILabel alloc] init];
        _aTime.textColor = [UIColor grayColor];
        _aTime.font = [UIFont systemFontOfSize:13];
        [view addSubview:_aTime];
        [_aTime makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(5);
            make.centerY.equalTo(view.centerY);
            make.width.equalTo(150);
        }];
    }
    return self;
}

- (void)play
{
    if (self.playerBlock)
    {
        self.playerBlock();
    }
}

- (void)setModel:(id)obj andTopArr:(NSArray *)arr
{
    Model *model = (Model *)obj;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:nil options:SDWebImageRetryFailed];
    _title.text = model.title;
    _aTime.text = model.ptime;
    int i = [model.length intValue];
    int min = (int)(i / 60);
    int sec = i % 60;
    
    _length.text = [NSString stringWithFormat:@"%d:%d", min, sec];
    
    _playCount.text = [NSString stringWithFormat:@"%d次播放", [model.sizeSD intValue]];
    
    NSDictionary *dic = (NSDictionary *)arr;
    _tName.text = [dic objectForKey:@"tname"];
    [_userIcon sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"topic_icons"]]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
