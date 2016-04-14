//
//  BTLIssueInquiry.h
//  BTLqipeipu
//
//  Created by cheng on 15/12/9.
//  Copyright © 2015年 baturu.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTLIssueInquiry : NSObject

// 发布询价的属性
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *oper;
@property (nonatomic, copy) NSString  *brandId;
@property (nonatomic, copy) NSString  *brandName;
@property (nonatomic, copy) NSString *carSysId;
@property (nonatomic, copy) NSString *carSysName;
@property (nonatomic, copy) NSString *era;
@property (nonatomic, copy) NSString *carTypeName;
@property (nonatomic, copy) NSString *carTypeId;
@property (nonatomic, copy) NSString  *evaldMin;
@property (nonatomic, copy) NSString  *invName;
@property (nonatomic, copy) NSString *reptType;
@property (nonatomic, copy) NSString *vinCode;
@property (nonatomic, copy) NSString  *reptCityId;
@property (nonatomic, copy) NSString *receiptdetail;

@property (nonatomic, copy) NSString  *state;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) NSString *filename;
@property (nonatomic, copy) NSString *filepath;

@end