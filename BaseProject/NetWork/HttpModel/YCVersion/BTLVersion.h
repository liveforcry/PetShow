//
//  BTLVersion.h
//  QiPeiPu
//
//  Created by cheng on 16/1/21.
//  Copyright © 2016年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTLVersion : NSObject
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *version;
@property(nonatomic, copy) NSString *status;
@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSString *desc;
@property(nonatomic, copy) NSString *versionIOS;
// 预留增加版本新特性介绍的属性
@property (nonatomic, copy) NSString  *str;
@end
