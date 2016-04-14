//
//  BTLShopCarInfo.m
//  QiPeiPu
//
//  Created by cheng on 15/12/15.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import "BTLShopCarInfo.h"

@implementation BTLShopCarInfo

+ (NSDictionary *)objectClassInArray
{
    return @{@"result":[BTLShopCarData class]};
}

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"stateData":@"state"};
}

- (NSInteger)count
{
    NSInteger CountNum = (NSInteger)self.result.count;
    [[NSUserDefaults standardUserDefaults] setValue:@"CountNum" forKey:@"Count"];
    return CountNum;
}

@end
