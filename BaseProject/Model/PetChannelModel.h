//
//  PetChannelModel.h
//  petShow
//
//  Created by baturu on 16/4/14.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "BaseModel.h"

@class ChannelData,ChannelList,ChannelActivity;
@interface PetChannelModel : BaseModel

@property (nonatomic, assign) NSInteger needLocation;

@property (nonatomic, strong) ChannelData *data;

@property (nonatomic, copy) NSString *errorMsg;

@property (nonatomic, copy) NSString *showTarget;

@property (nonatomic, copy) NSString *staticUrl;

@property (nonatomic, copy) NSString *showFont;

@property (nonatomic, copy) NSString *showType;

@property (nonatomic, assign) NSInteger errorCode;

@end
@interface ChannelData : NSObject

@property (nonatomic, copy) NSString *count;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<ChannelList *> *list;

@end

@interface ChannelList : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *s_icon;

@property (nonatomic, copy) NSString *hits;

@property (nonatomic, copy) NSString *user_num;

@property (nonatomic, copy) NSString *background;

@property (nonatomic, copy) NSString *last_pubtime;

@property (nonatomic, copy) NSString *recomm;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *daily_user;

@property (nonatomic, copy) NSString *last_ppid;

@property (nonatomic, strong) ChannelActivity *activity;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, assign) NSInteger activity_type;

@property (nonatomic, copy) NSString *last_photo;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *addtime;

@property (nonatomic, copy) NSString *level_icon;

@property (nonatomic, copy) NSString *note;

@property (nonatomic, copy) NSString *tequan;

@property (nonatomic, copy) NSString *channel_id;

@property (nonatomic, copy) NSString *pic_num;

@property (nonatomic, copy) NSString *plnum;

@property (nonatomic, copy) NSString *activity_num;

@property (nonatomic, copy) NSString *background_id;

@property (nonatomic, copy) NSString *description;

@end

@interface ChannelActivity : NSObject

@end

