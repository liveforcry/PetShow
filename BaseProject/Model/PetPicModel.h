//
//  PetPicModel.h
//  petShow
//
//  Created by baturu on 16/4/14.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "BaseModel.h"

@class Attachment,Follows;
@interface PetPicModel : BaseModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, copy) NSString *debug;

@property (nonatomic, strong) Attachment *attachment;

@end
@interface Attachment : NSObject

@property (nonatomic, strong) NSArray<Follows *> *follows;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger myRank;

@end

@interface Follows : NSObject

@property (nonatomic, assign) NSInteger rank;

@property (nonatomic, copy) NSString *headFace;

@property (nonatomic, assign) NSInteger userflower;

@property (nonatomic, assign) NSInteger rcode;

@property (nonatomic, assign) NSInteger eachOther;

@property (nonatomic, copy) NSString *level1;

@property (nonatomic, assign) NSInteger userpopularity;

@property (nonatomic, assign) NSInteger followed;

@property (nonatomic, assign) NSInteger score;

@property (nonatomic, copy) NSString *sign;

@property (nonatomic, assign) NSInteger gender;

@property (nonatomic, copy) NSString *level0;

@property (nonatomic, assign) NSInteger userxpurchase;

@property (nonatomic, assign) NSInteger followedMe;

@property (nonatomic, assign) NSInteger level;

@property (nonatomic, assign) NSInteger head;

@property (nonatomic, assign) NSInteger userscore;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *level2;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, assign) NSInteger vip;

@property (nonatomic, assign) NSInteger vlevel;

@property (nonatomic, copy) NSString *astar;

@end

