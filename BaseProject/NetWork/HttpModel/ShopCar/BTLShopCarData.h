//
//  YCShopCar.h
//  BTLqipeipu
//
//  Created by cheng on 15/12/9.
//  Copyright © 2015年 baturu.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTLItem.h"

@interface BTLShopCarData: NSObject

@property (nonatomic, copy) NSString *result;
@property (nonatomic, copy) NSString  *carTypeId;
@property (nonatomic, copy) NSString  *carTypeName;
@property (nonatomic, copy) NSString  *from;
@property (nonatomic, copy) NSString  *fromDetail;
@property (nonatomic, copy) NSArray *items;

@property (nonatomic, copy) NSString  *itemsCount;
@property (nonatomic, copy) NSString  *status;
@property (nonatomic, copy) NSString  *statusName;
@property (nonatomic, copy) NSString  *vin;

@property (nonatomic, assign) NSInteger headCount;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) CGFloat height;
//@property (nonatomic, assign) BOOL flag;
@property (nonatomic, assign) BOOL flag;
//@property (nonatomic, assign) NSInteger count;

@property (nonatomic,assign)NSInteger sectionTag;
@property (nonatomic, assign) BOOL  beSectionFlag;

@end
