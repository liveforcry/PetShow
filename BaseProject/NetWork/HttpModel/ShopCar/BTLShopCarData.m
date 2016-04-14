//
//  YCShopCar.m
//  BTLqipeipu
//
//  Created by cheng on 15/12/9.
//  Copyright © 2015年 baturu.com. All rights reserved.
//

#import "BTLShopCarData.h"
//#import ""

@implementation BTLShopCarData

+ (NSDictionary *)objectClassInArray
{
    return @{@"items":[BTLItem class]};
}

//- (NSInteger)sectionTag{
//    
//}

//- (void)setSectionTag:(NSInteger)sectionTag
//{
//    _sectionTag = sectionTag;
//}
//
//- (CGFloat)height
//{
//    if (_height == 0) {
//    
//        NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
//        CGRect rect = [self.carTypeName boundingRectWithSize:CGSizeMake(kMainScreenWidth-40-33, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
//
//        _height += 10 + rect.size.height + 10;
//        
//        if (_height < 23+20) {
//            _height = 43;
//        }
//        
////        if (headViewFlag)
//        NSLog(@"%ld", (long)NEWCellOneCount);
//        if (self.sectionTag == NEWCellOneCount){
////            _height += 20;
//            NSDictionary *attributeStr = @{NSFontAttributeName:[UIFont systemFontOfSize:11]};
//            NSString *str = @"失效";
//            CGRect rectStr = [str boundingRectWithSize:CGSizeMake(kMainScreenWidth-40-33, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributeStr context:nil];
////            _height += 20 + rectStr.size.height;
////            _height = 86;
//            _height += 46;
//        }
//       
//    }
//    NSLog(@"_height : %lf", _height);
//    return _height;
////    return 100;
//}


@end
