//
//  BTLUserInfoData.m
//  QiPeiPu
//
//  Created by cheng on 15/12/12.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import "BTLUserInfoData.h"
#import "BTLInquiryData.h"

@implementation BTLUserInfoData
+ (NSDictionary *)objectClassInArray
{
    return @{@"inquiryStateCount":[BTLInquiryData class], @"orderStateCount":[BTLInquiryData class]};
}

@end
