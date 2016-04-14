//
//  BTLIssueHelpSearch.h
//  BTLqipeipu
//
//  Created by cheng on 15/12/9.
//  Copyright © 2015年 baturu.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTLIssueHelpSearch : NSObject

//  有关帮我发布搜索的 属性
@property (nonatomic, assign) BOOL flag;
@property (nonatomic, copy) NSString *cactTel;
@property (nonatomic, copy) NSString *helpContent;
@property (nonatomic, copy) NSString *imgurl;
@property (nonatomic, copy) NSString *opType;
@property (nonatomic, copy) NSString  *searchId;
@property (nonatomic, assign) NSInteger pageIdx;
@property (nonatomic, copy) NSString *ISSHelpSearchId;
@property (nonatomic, copy) NSString *helpId;
@property (nonatomic, copy) NSString *recieptMainId;

@property (nonatomic, copy) NSString *searchNo;
@property (nonatomic, copy) NSString *cactMan;
// @property (nonatomic, copy) NSString *cactTel;
@property (nonatomic, copy) NSString *publishTime;
//@property (nonatomic, copy) NSString *helpContent;
@property (nonatomic, copy) NSString *receiptMId;

@property (nonatomic, copy) NSString *carTypeID;
@property (nonatomic, copy) NSString *reptCityName3;
@property (nonatomic, copy) NSString *reptCityName1;
@property (nonatomic, copy) NSString *reptCityName2;
@property (nonatomic, copy) NSString *vinNum;
@property (nonatomic, copy) NSString *brandId;
@property (nonatomic, copy) NSString *brandName;
@property (nonatomic, copy) NSString *carSystemID;
@property (nonatomic, copy) NSString *reptCityID2;
@property (nonatomic, copy) NSString *reptCityID1;
@property (nonatomic, copy) NSString *reptCityID3;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, copy) NSString *carTypeName;
@property (nonatomic, copy) NSString *carSysName;
@property (nonatomic, copy) NSString *dtlId;
@property (nonatomic, copy) NSString  *partsFactory;
@property (nonatomic, copy) NSString  *memo;
@property (nonatomic, copy) NSString  *partsCode;
@property (nonatomic, assign) NSInteger  needNum;
@property (nonatomic, copy) NSString  *partsName;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) NSString *result;
@property (nonatomic, copy) NSString  *len;
@property (nonatomic, copy) NSString  *data;

@property (nonatomic, copy) NSString *ImgId;
@property (nonatomic, copy) NSString *ImgUrl;

@end
