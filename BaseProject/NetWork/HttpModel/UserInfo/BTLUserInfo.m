//
//  BTLUserInfo.m
//  QiPeiPu
//
//  Created by cheng on 15/12/12.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import "BTLUserInfo.h"

@implementation BTLUserInfo
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"status":@"state"};
}
@end
