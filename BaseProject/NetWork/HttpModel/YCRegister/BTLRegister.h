//
//  BTLRegister.h
//  BTLqipeipu
//
//  Created by cheng on 15/12/9.
//  Copyright © 2015年 baturu.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTLRegister : NSObject

// 1.  接口地址：验证  ：http://mobileapi.qipeipu.com/mobileapi/bs/userlg/get/code?telNum=13282199927

// 注册的属性
@property (nonatomic, copy) NSString *telNum;
@property (nonatomic, copy) NSString *verifyCode;
@property (nonatomic, copy) NSString *pwd;
@property (nonatomic, copy) NSString *orgName;
@property (nonatomic, copy) NSString *businessLicensePic;
@property (nonatomic, copy) NSString *businessLicenseNo;
@property (nonatomic, copy) NSString  *legalPerson;
@property (nonatomic, copy) NSString  *contactPerson;
@property (nonatomic, copy) NSString  *contactMobile;
@property (nonatomic, copy) NSString  *businessType;
@property (nonatomic, copy) NSString  *cityId;
@property (nonatomic, copy) NSString  *cityName;
@property (nonatomic, copy) NSString  *provinceID;
@property (nonatomic, copy) NSString  *provinceName;
@property (nonatomic, copy) NSString  *address;


@property (nonatomic, copy) NSString  *state;
@property (nonatomic, copy) NSString *msg;
@end
