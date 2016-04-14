//
//  BTLLoginResponse.h
//  QiPeiPu
//
//  Created by BTL on 15/12/7.
//  Copyright © 2015年 BTL. All rights reserved.
//
//
#import <Foundation/Foundation.h>

@interface BTLLoginResponse : NSObject
@property(nonatomic,copy) NSString *state;
@property(nonatomic,copy) NSString *custId;
@property(nonatomic,copy) NSString *userName;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *tel;
@property(nonatomic,copy) NSString *cactMan;
@property(nonatomic,copy) NSString *cactTel;
@property(nonatomic,copy) NSString *level;
@property(nonatomic,copy) NSString *levelName;
@property(nonatomic,copy) NSString *credit;
@property(nonatomic,copy) NSString *photoUrl;
@property(nonatomic,copy) NSString *SKUNum;

@property(nonatomic,copy) NSString *userId;

@property(nonatomic,copy) NSString *msg;
@end
