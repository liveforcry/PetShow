//
//  BTLHttpTool.h
//  QiPeiPu
//
//  Created by cheng on 15/12/7.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTLHttpTool : NSObject
+ (void)get:(NSString *)url param:(NSString *)param success:(void (^)(id))success failure:(void (^)(NSError *))failure;


+ (void)post:(NSString *)url param:(NSString *)param success:(void (^)(id))success failure:(void (^)(NSError *))failure;


@end
