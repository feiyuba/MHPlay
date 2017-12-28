//
//  MHTableViewCell.h
//  MHPlayer
//
//  Created by 飞鱼 on 2017/12/28.
//  Copyright © 2017年 马浩. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PlayerBlock)(void);

@interface MHTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *tName;
@property (nonatomic, strong) UILabel *aTime;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIImageView *userIcon;
@property (nonatomic, strong) UILabel *length;
@property (nonatomic, strong) UILabel *playCount;

@property (nonatomic, copy  ) PlayerBlock playerBlock;

- (void)setModel:(id)obj andTopArr:(NSArray *)arr;

@end
