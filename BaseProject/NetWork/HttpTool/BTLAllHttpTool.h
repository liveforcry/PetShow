//
//  BTLAllHttpTool.h
//  QiPeiPu
//
//  Created by cheng on 15/12/7.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTLHttpTool.h"
#import "BTLLoginResponse.h"
#import "BTLUserInfo.h"
#import "BTLShopCarInfo.h"
#import "BTLExitLogin.h"
#import "BTLOrderPay.h"
#import "BTLConfirmOrderInfo.h"
#import "OrderCardPayInfo.h"
#import "BTLHelpMeMakingOfferInfo.h"
#import "BTLHelpMeMakedOfferInfo.h"

#import "BTLOrderInfo.h"
#import "BTLOrderListInfo.h"
#import "ReturnExchangeInfo.h"
#import "BTLMineOrder.h"
#import "PayResult.h"

#import "BTLVersion.h"

#import "WXPaySDK.h"

#import "deleteInfo.h"
#import "UpDataShopInfo.h"
#import "ReceiveInfo.h"
#import "ReturnFreightInfo.h"

#import "BTLCommitInfo.h"
#import "BTLPirmeInfo.h"
#import "BalancePayInfo.h"

@interface BTLAllHttpTool : NSObject
+ (void)loginWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLLoginResponse *result))success failure:(void (^)(NSError *error))failure;

+ (void)userInfoWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLUserInfo *result))success failure:(void (^)(NSError *error))failure;

+ (void)carWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLShopCarInfo *result))success failure:(void (^)(NSError *error))failure;

+ (void)exitLoginWithUrl:(NSString *)url Param:(NSString *)param success:(void(^)(BTLExitLogin *result))success failure:(void(^)(NSError *error))failure;

+ (void)orderPayWithUrl:(NSString *)url Param:(NSString *)param success:(void(^)(BTLOrderPay *result))success failure:(void(^)(NSError *error))failure;

+ (void)confirmOrderWithUrl:(NSString *)url Param:(NSString *)param success:(void(^)(BTLConfirmOrderInfo *result))success failure:(void(^)(NSError *error))failure;

+ (void)orderCardPayWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(OrderCardPayInfo *))success failure:(void (^)(NSError *))failure;

+ (void)helpMeFindWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLHelpMeMakingOfferInfo *))success failure:(void (^)(NSError *))failure;

+ (void)helpMeMakedWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLHelpMeMakedOfferInfo *))success failure:(void (^)(NSError *))failure;

+ (void)orderInfoWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLOrderInfo *))success failure:(void (^)(NSError *))failure;

+ (void)orderListInfoWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLOrderListInfo *))success failure:(void (^)(NSError *))failure;
+ (void)payResultWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(PayResult *))success failure:(void (^)(NSError *))failure;

+ (void)returnExchangeWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(ReturnExchangeInfo *))success failure:(void (^)(NSError *))failure;

+ (void)versionWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLVersion *))success failure:(void (^)(NSError *))failure;

+ (void)wxPayWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(WXPaySDK *))success failure:(void (^)(NSError *))failure;

+ (void)deleteShopWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(deleteInfo *))success failure:(void (^)(NSError *))failure;
+ (void)updataShop:(NSString *)url Param:(NSString *)param success:(void (^)(UpDataShopInfo *))success failure:(void (^)(NSError *))failure;
+ (void)receiveInfoWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(ReceiveInfo *))success failure:(void (^)(NSError *))failure;
+ (void)returnFreightShop:(NSString *)url Param:(NSString *)param success:(void (^)(ReturnFreightInfo *))success failure:(void (^)(NSError *))failure;
+ (void)shopCommitWitUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLCommitInfo *))success failure:(void (^)(NSError *))failure;
+ (void)shopPirmeWitUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLPirmeInfo *))success failure:(void (^)(NSError *))failure;

+ (void)balancePayWitUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BalancePayInfo *))success failure:(void (^)(NSError *))failure;
//我的订单请求网络方法
//pageID 参数 选择了哪一个
//url 请求基础url
//param 请求参数字典
+(void)MineOrderWithPageId :(NSString *)pageId url : (NSString *)url Param:(NSString *) param success:(void (^)(BTLMineOrder *))success failure:(void (^)(NSError *))failure;
@end
