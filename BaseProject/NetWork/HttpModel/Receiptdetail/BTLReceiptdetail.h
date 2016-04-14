//
//  BTLReceiptdetail.h
//  BTLqipeipu
//
//  Created by cheng on 15/12/9.
//  Copyright © 2015年 baturu.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTLReceiptdetail : NSObject

// 发布询价 一个数组模型
@property (nonatomic, copy) NSString  *idx;
@property (nonatomic, copy) NSString *partsName;
@property (nonatomic, copy) NSString *partsCode;
@property (nonatomic, assign) NSInteger needNum;
@property (nonatomic, copy) NSString *ptFactTpId;
@property (nonatomic, copy) NSString *IssuePartsName;
@property (nonatomic, copy) NSString *memo;
@property (nonatomic, copy) NSString *imgUrl;

@end
