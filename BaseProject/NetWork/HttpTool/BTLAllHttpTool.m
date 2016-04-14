//
//  BTLAllHttpTool.m
//  QiPeiPu
//
//  Created by cheng on 15/12/7.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import "BTLAllHttpTool.h"


@implementation BTLAllHttpTool
+ (void)loginWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLLoginResponse *result))success failure:(void (^)(NSError *error))failure
{
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        BTLLoginResponse *result = [BTLLoginResponse objectWithKeyValues:dict];
        NSLog(@"%@",dict);
        if (success) {
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)userInfoWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLUserInfo *))success failure:(void (^)(NSError *))failure
{
    NSLog(@"url = %@ ", url);
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        
        BTLUserInfo *result = [BTLUserInfo objectWithKeyValues:dict];

        if (success) {
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


+ (void)carWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLShopCarInfo *result))success failure:(void (^)(NSError *error))failure
{
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        BTLShopCarInfo *result = [BTLShopCarInfo objectWithKeyValues:dict];
//        NSLog(@"%@",dict);
        if (success) {
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)exitLoginWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLExitLogin *result))success failure:(void (^)(NSError *))failure
{
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict){
        BTLExitLogin *result = [BTLExitLogin objectWithKeyValues:dict];
//        NSLog(@"%@", dict);
        if (success) {
            success(result);
        }
    } failure:^(NSError *error){
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)orderPayWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLOrderPay *))success failure:(void (^)(NSError *))failure
{
    
    [BTLHttpTool post:url param:param success:^(NSDictionary *dict){
        
//        NSLog(@"******************dict  %@************", dict);
        
        BTLOrderPay *result = [BTLOrderPay objectWithKeyValues:dict];
        
        
        if (success) {
            success(result);}
        }failure:^(NSError *error){
            if (failure) {
                failure(error);
                NSLog(@"failure  %@", error);
            }
        }
    ];
}

+ (void)confirmOrderWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLConfirmOrderInfo *))success failure:(void (^)(NSError *))failure
{
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        BTLConfirmOrderInfo *result = [BTLConfirmOrderInfo objectWithKeyValues:dict];
        if (success) {
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure  %@", error);
        }
    }];
}


+ (void)orderCardPayWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(OrderCardPayInfo *))success failure:(void (^)(NSError *))failure
{
  
    [BTLHttpTool post:url param:param success:^(NSDictionary *dict){
        
        OrderCardPayInfo *result = [OrderCardPayInfo objectWithKeyValues:dict];
        
        
        if (success) {
            success(result);}
    }failure:^(NSError *error){
        if (failure) {
            failure(error);
            NSLog(@"failure  %@", error);
        }
    }
     ];

}

+ (void)helpMeFindWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLHelpMeMakingOfferInfo *))success failure:(void (^)(NSError *))failure
{
    
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict){
        
        BTLHelpMeMakingOfferInfo *result = [BTLHelpMeMakingOfferInfo objectWithKeyValues:dict];
        
        
        if (success) {
            success(result);}
    }failure:^(NSError *error){
        if (failure) {
            failure(error);
            NSLog(@"failure  %@", error);
        }
    }
     ];
}


+ (void)helpMeMakedWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLHelpMeMakedOfferInfo *))success failure:(void (^)(NSError *))failure
{
    
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict){
        
        BTLHelpMeMakedOfferInfo *result = [BTLHelpMeMakedOfferInfo objectWithKeyValues:dict];
        
        
        if (success) {
            success(result);}
    }failure:^(NSError *error){
        if (failure) {
            failure(error);
            NSLog(@"failure  %@", error);
        }
    }
     ];
}

+ (void)orderInfoWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLOrderInfo *))success failure:(void (^)(NSError *))failure
{
    
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict){
        
        BTLOrderInfo *result = [BTLOrderInfo objectWithKeyValues:dict];
        
        
        if (success) {
            success(result);}
    }failure:^(NSError *error){
        if (failure) {
            failure(error);
            NSLog(@"failure  %@", error);
        }
    }
     ];
    
}

+ (void)orderListInfoWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLOrderListInfo *))success failure:(void (^)(NSError *))failure
{
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        BTLOrderListInfo *result = [BTLOrderListInfo objectWithKeyValues:dict];
        if (success) {
            success(result);
        }
        NSLog(@"%@", dict);
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure %@", error);
        }
    }];
}

+ (void)payResultWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(PayResult *))success failure:(void (^)(NSError *))failure
{
    [BTLHttpTool post:url param:param success:^(NSDictionary *dict) {
        PayResult *result = [PayResult objectWithKeyValues:dict];
        if (success) {
            success(result);
        }
        NSLog(@"%@", dict);
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure %@", error);
        }
    }];
}

+ (void)returnExchangeWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(ReturnExchangeInfo *))success failure:(void (^)(NSError *))failure
{
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        ReturnExchangeInfo *result = [ReturnExchangeInfo objectWithKeyValues:dict];
        if (success) {
            success(result);
        }
        NSLog(@"%@", dict);
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure %@", error);
        }
    }];
}

+ (void)versionWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLVersion *))success failure:(void (^)(NSError *))failure
{
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        BTLVersion *result = [BTLVersion objectWithKeyValues:dict];
        if (success) {
            success(result);
        }
        NSLog(@"%@", dict);
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure %@", error);
        }
    }];
}

+ (void)wxPayWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(WXPaySDK *))success failure:(void (^)(NSError *))failure
{
    [BTLHttpTool post:url param:param success:^(NSDictionary *dict) {
        WXPaySDK *result = [WXPaySDK objectWithKeyValues:dict];
        if (success) {
            success(result);
        }
        NSLog(@"%@", dict);
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure %@", error);
        }
    }];
}

+ (void)deleteShopWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(deleteInfo *))success failure:(void (^)(NSError *))failure
{
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        deleteInfo *result = [deleteInfo objectWithKeyValues:dict];
        if (success) {
            success(result);
        }
        NSLog(@"%@", dict);
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure %@", error);
        }
    }];
}

+ (void)updataShop:(NSString *)url Param:(NSString *)param success:(void (^)(UpDataShopInfo *))success failure:(void (^)(NSError *))failure{
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        NSLog(@"result %@", dict);
        UpDataShopInfo *result = [UpDataShopInfo objectWithKeyValues:dict];
        if (success) {
            success(result);
        }
        NSLog(@"%@", dict);
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure %@", error);
        }
    }];
}

+ (void)receiveInfoWithUrl:(NSString *)url Param:(NSString *)param success:(void (^)(ReceiveInfo *))success failure:(void (^)(NSError *))failure
{
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        ReceiveInfo *result = [ReceiveInfo objectWithKeyValues:dict];
        if (success) {
            success(result);
        }
        NSLog(@"%@", dict);
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure %@", error);
        }
    }];
}

+ (void)returnFreightShop:(NSString *)url Param:(NSString *)param success:(void (^)(ReturnFreightInfo *))success failure:(void (^)(NSError *))failure
{
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        ReturnFreightInfo *result = [ReturnFreightInfo objectWithKeyValues:dict];
        if (success) {
            success(result);
        }
        NSLog(@"%@", dict);
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure %@", error);
        }
    }];
    
}


+ (void)shopCommitWitUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLCommitInfo *))success failure:(void (^)(NSError *))failure{
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        BTLCommitInfo *result = [BTLCommitInfo objectWithKeyValues:dict];
        if (success) {
            success(result);
        }
        NSLog(@"%@", dict);
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure %@", error);
        }
    }];
}

+ (void)shopPirmeWitUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BTLPirmeInfo *))success failure:(void (^)(NSError *))failure{
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        BTLPirmeInfo *result = [BTLPirmeInfo objectWithKeyValues:dict];
        if (success) {
            success(result);
        }
        NSLog(@"%@", dict);
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure %@", error);
        }
    }];
}

+ (void)balancePayWitUrl:(NSString *)url Param:(NSString *)param success:(void (^)(BalancePayInfo *))success failure:(void (^)(NSError *))failure{
    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        BalancePayInfo *result = [BalancePayInfo objectWithKeyValues:dict];
        if (success) {
            success(result);
        }
        NSLog(@"%@", dict);
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure %@", error);
        }
    }];
}
//我的订单请求方法
+(void)MineOrderWithPageId :(NSString *)pageId url : (NSString *)url Param:(NSString *) param success:(void (^)(BTLMineOrder *))success failure:(void (^)(NSError *))failure{

    [BTLHttpTool get:url param:param success:^(NSDictionary *dict) {
        BTLMineOrder *result = [BTLMineOrder objectWithKeyValues:dict];
        
        if (success) {
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure %@", error);
        }
    }];

}

@end
