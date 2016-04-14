//
//  PacketMap.h
//  QiPeiPu
//
//  Created by cheng on 16/2/23.
//  Copyright © 2016年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PacketMap : NSObject

@property (nonatomic, copy) NSString  *package;
@property (nonatomic, copy) NSString  *appid;
@property (nonatomic, copy) NSString  *sign;
@property (nonatomic, copy) NSString  *partnerid;
@property (nonatomic, copy) NSString  *prepayid;
@property (nonatomic, copy) NSString  *noncestr;
@property (nonatomic, assign) UInt32  timestamp;

@end
