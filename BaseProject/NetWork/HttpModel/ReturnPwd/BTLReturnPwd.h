//
//  BTLReturnPwd.h
//  BTLqipeipu
//
//  Created by cheng on 15/12/9.
//  Copyright © 2015年 baturu.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTLReturnPwd : NSObject

// 接口地址：http://mobileapi.qipeipu.com/mobileapi/bs/userlg/forgotPassword/sendSms?telNum=13282199926
// 找回密码的属性
@property (nonatomic, copy) NSString  *telNum;
@property (nonatomic, copy) NSString  *verifyCode;
@property (nonatomic, copy) NSString  *pwd;

@property (nonatomic, copy) NSString  *state;
@property (nonatomic, copy) NSString *msg;

@end
