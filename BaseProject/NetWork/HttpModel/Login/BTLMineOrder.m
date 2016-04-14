//
//  BTLMineOrder.m
//  QiPeiPu
//
//  Created by baturu on 16/4/8.
//  Copyright © 2016年 YC. All rights reserved.
//

#import "BTLMineOrder.h"

@implementation BTLMineOrder


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [BTLMineOrderData class]};
}
@end
@implementation BTLMineOrderData
//
//-(CGFloat)height{
//    if (_height == 0) {
//        NSDictionary *attribute = @{NSFontAttributeName :[UIFont systemFontOfSize:14]};
//
//        CGRect rectDis = [self.carDisplayName boundingRectWithSize:CGSizeMake(kMainScreenWidth - 10 - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
//        CGRect rectParts = [self.allPartsName boundingRectWithSize:CGSizeMake(kMainScreenWidth - 10 - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
////        _height += 10 + rectDis.size.height + rectParts.size.height + 10 + 20 + 1 + 
//        return _height + rectDis.size.height + rectParts.size.height + 40 + 40 + 10 + 10 + 20;
//    }
//    return _height;
//}
@end


