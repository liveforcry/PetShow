//
//  BTLUserInfoData.h
//  QiPeiPu
//
//  Created by cheng on 15/12/12.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTLInquiryData.h"


@interface BTLUserInfoData : NSObject
@property(nonatomic, copy) NSString *balance;
@property(nonatomic, strong) NSArray *inquiryStateCount;
@property(nonatomic, copy) NSString *nickName;
@property(nonatomic, strong) NSArray *orderStateCount;
@property(nonatomic, copy) NSString *orgLevel;
@property(nonatomic, copy) NSString *orgName;
@property(nonatomic, copy) NSString *userImageUrl;

@end

