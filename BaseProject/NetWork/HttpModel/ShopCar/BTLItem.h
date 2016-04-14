//
//  BTLItem.h
//  QiPeiPu
//
//  Created by cheng on 15/12/15.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTLItem : NSObject

@property (nonatomic, copy) NSString *MFctyId;

@property (nonatomic, copy) NSString *bizId;

@property (nonatomic, copy) NSString  *bizType;
@property (nonatomic, copy) NSString  *brandName;
@property (nonatomic, copy) NSString  *carTypeId;
@property (nonatomic, copy) NSString  *cartId;
@property (nonatomic, copy) NSString  *factoryType;
@property (nonatomic, copy) NSString  *invoiceType;
@property (nonatomic, copy) NSString  *memo;
@property (nonatomic, copy) NSString  *num;
@property (nonatomic, copy) NSString  *partsCode;
@property (nonatomic, copy) NSString  *partsName;
@property (nonatomic, copy) NSString  *partsType;
@property (nonatomic, copy) NSString  *platform;
@property (nonatomic, copy) NSString  *price;
@property (nonatomic, copy) NSString  *status;
@property (nonatomic, copy) NSString  *stockId;
@property (nonatomic, copy) NSString  *unitPrice;
@property (nonatomic, copy) NSString  *userId;
@property (nonatomic, copy) NSString  *vinNum;
@property (nonatomic, copy) NSString  *warranty;

//@property (nonatomic, assign) BOOL flag;
@property (nonatomic, assign) CGFloat height;
//@property (nonatomic, assign) CGFloat sectionCount;
//@property (nonatomic, assign) CGFloat cellCount;

@property (nonatomic, assign) BOOL flag;
@property(nonatomic, assign) NSInteger cellCount;

@property (nonatomic,assign)NSInteger sectionTag;
@property (nonatomic,assign)NSInteger rowTag;
@property (nonatomic, assign) NSInteger  totalCountCell;
@property (nonatomic, assign) double totalMoneyCell;

@property (nonatomic, assign) BOOL  beCellFlag;

//@property (nonatomic, assign) 
@end
