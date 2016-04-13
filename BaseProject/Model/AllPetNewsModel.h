//
//  AllPetNewsModel.h
//  petShow
//
//  Created by baturu on 16/4/6.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "BaseModel.h"

//@class Data,DataRmdUsers,DataRmdUserList,DataList,DataListChannel_Info,DataListUser_Info,DataListPhotoDesFormat,DataListExtra,DataListPetInfo,DataListZanList,DataListPhoto;

@class Data,DataRmdUsers,DataRmdUserList,DataList,DataListChannelInfo,DataListUserInfo,DataListPhotoDesFormat,DataListExtra,DataListPetInfo,DataListZan_List,DataListPhoto;
@interface AllPetNewsModel : BaseModel

@property (nonatomic, assign) NSInteger needLocation;

@property (nonatomic, strong) Data *data;

@property (nonatomic, copy) NSString *errorMsg;

@property (nonatomic, copy) NSString *showTarget;

@property (nonatomic, copy) NSString *staticUrl;

@property (nonatomic, copy) NSString *showFont;

@property (nonatomic, copy) NSString *showType;

@property (nonatomic, assign) NSInteger errorCode;

@end
@interface Data : NSObject

@property (nonatomic, strong) DataRmdUsers *rmd_users;

@property (nonatomic, strong) NSArray *rmd_adv;

@property (nonatomic, strong) NSArray<DataList *> *list;

@property (nonatomic, copy) NSString *page_id;

@end

@interface DataRmdUsers : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<DataRmdUserList *> *list;

@property (nonatomic, assign) NSInteger index;

@end

@interface DataRmdUserList : NSObject

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *level_icon;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *des;

@end

@interface DataList : NSObject

@property(nonatomic,assign)CGFloat height;

@property (nonatomic, copy) NSString *share_target;

@property (nonatomic, copy) NSString *city_id;

@property (nonatomic, copy) NSString *ppid;

@property (nonatomic, strong) NSArray<DataListZan_List *> *zan_list;

@property (nonatomic, strong) DataListPetInfo *pet_info;

@property (nonatomic, copy) NSString *target;

@property (nonatomic, copy) NSString *photo_size;

@property (nonatomic, assign) NSInteger is_zan;

@property (nonatomic, strong) DataListExtra *extra;

@property (nonatomic, strong) DataListChannelInfo *channel_info;

@property (nonatomic, copy) NSString *is_auto;

@property (nonatomic, copy) NSString *zan;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *photo_des;

@property (nonatomic, strong) DataListUserInfo *user_info;

@property (nonatomic, assign) NSInteger is_admin;

@property (nonatomic, copy) NSString *rmd_id;

@property (nonatomic, strong) NSArray<DataListPhoto *> *photo;

@property (nonatomic, copy) NSString *zan_ico;

@property (nonatomic, copy) NSString *plnum;

@property (nonatomic, copy) NSString *channel_id;

@property (nonatomic, strong) DataListPhotoDesFormat *photo_des_format;

@end

@interface DataListChannelInfo : NSObject

@property (nonatomic, copy) NSString *channel_id;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *s_icon;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *target;

@end

@interface DataListUserInfo : NSObject

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *birth;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *level_icon;

@property (nonatomic, assign) NSInteger rlstatus;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *regdate;

@property (nonatomic, copy) NSString *pid;

@end

@interface DataListPhotoDesFormat : NSObject

@end

@interface DataListExtra : NSObject

@end

@interface DataListPetInfo : NSObject

@property (nonatomic, copy) NSString *petname;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *ptname;

@property (nonatomic, copy) NSString *pttype;

@property (nonatomic, copy) NSString *birth;

@property (nonatomic, copy) NSString *photo;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *pid;

@end

@interface DataListZan_List : NSObject

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *level_icon;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *des;

@end

@interface DataListPhoto : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *size;

@end

