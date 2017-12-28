//
//  Model.h
//  MHPlayer
//
//  Created by 飞鱼 on 2017/12/28.
//  Copyright © 2017年 马浩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, strong) NSString *cover;
@property (nonatomic, strong) NSString *descript;
@property (nonatomic, strong) NSString *length;
@property (nonatomic, strong) NSString *m3u8hd_url;
@property (nonatomic, strong) NSString *m3u8_url;
@property (nonatomic, strong) NSString *mp4hd_url;
@property (nonatomic, strong) NSString *mp4_url;
@property (nonatomic, strong) NSString *playCount;
@property (nonatomic, strong) NSString *playersize;
@property (nonatomic, strong) NSString *ptime;
@property (nonatomic, strong) NSString *replayCount;
@property (nonatomic, strong) NSString *replayid;
@property (nonatomic, strong) NSString *sectiontitle;
@property (nonatomic, strong) NSString *sizeHD;
@property (nonatomic, strong) NSString *sizeSD;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *topicDesc;
@property (nonatomic, strong) NSString *topImg;
@property (nonatomic, strong) NSString *vid;
@property (nonatomic, strong) NSArray *videoTopic;
@property (nonatomic, strong) NSString *videosource;
@property (nonatomic, strong) NSString *votecount;

@end
