//
//  BTLHttpTool.m
//  QiPeiPu
//
//  Created by cheng on 15/12/7.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import "BTLHttpTool.h"

@implementation BTLHttpTool
+ (void)post:(NSString *)url param:(NSString *)param success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    NSTimer *myTimer = [NSTimer scheduledTimerWithTimeInterval:30 target:self selector:@selector(scrollTimer) userInfo:nil repeats:NO];
//    mgr.requestSerializer = [[TimeoutAFHTTPRequestSerializer alloc] initWithTimeout:30];
    
    // 设置超时时间
    [mgr.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    mgr.requestSerializer.timeoutInterval = 30.f;
    [mgr.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/csv",@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    
    [mgr.requestSerializer setValue:@"ios" forHTTPHeaderField:@"PLATFORM_IOS"];
     NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [mgr.requestSerializer setValue:version forHTTPHeaderField:@"VERSION"];
    [mgr.requestSerializer setValue:@"2" forHTTPHeaderField:@"PLATFORM"];
    
    
//    int WEBSITE = 0;
//    int ANDROID = 1;
//    int APPLE = 2;
//    int WECHAT = 3;
//    public static final String VERSION = "version";
//    public static final String PLATFORM = "platform";
//    public static final String PLATFORM_IOS = "ios";


//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[baseUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
//    [mgr.requestSerializer setValue:[NSString stringWithFormat:@"%@=%@;Domain=test.mobileapi.qipeipu.net;path=/", CookieName, CookieLogin] forHTTPHeaderField:@"Cookie"];
//    [mgr.requestSerializer setValue:[NSString stringWithFormat:@"%@=%@;Domain=test.m.qipeipu.net;path=/", CookieName, CookieLogin] forHTTPHeaderField:@"Cookie"];
    
    [mgr.requestSerializer setValue:[NSString stringWithFormat:@"SERVERID=2019a9e14b1e4444b709a60fc1d7d7c6|1460605449|1460604558"] forHTTPHeaderField:@"Cookie"];
//
//    NSLog(@"Cookie  %@=%@", CookieName, CookieLogin);
    //发送POST请求
    [mgr POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObj) {
        if (success) {
            NSError *err;
            NSString *string = [[NSString alloc] initWithData:responseObj encoding:NSUTF8StringEncoding];
            if(err) {
                NSLog(@"json解析失败：%@",err);
            }

            success(string);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)get:(NSString *)url param:(NSString *)param success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
//    mgr.requestSerializer = [[TimeoutAFHTTPRequestSerializer alloc] initWithTimeout:30];
    
    // 设置超时时间
    [mgr.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    mgr.requestSerializer.timeoutInterval = 30.f;
    [mgr.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/csv",@"application/json",@"text/json", @"text/plain", @"text/html",@"application/text", nil];
    
//    [mgr.requestSerializer setValue:@"ios" forHTTPHeaderField:@"platform"];
//    [mgr.requestSerializer setValue:@"3.0.0" forHTTPHeaderField:@"version"];

    [mgr.requestSerializer setValue:@"ios" forHTTPHeaderField:@"PLATFORM_IOS"];
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [mgr.requestSerializer setValue:version forHTTPHeaderField:@"VERSION"];
    [mgr.requestSerializer setValue:@"2" forHTTPHeaderField:@"PLATFORM"];
    
//    if (CookieName) {
//        [mgr.requestSerializer setValue:[NSString stringWithFormat:@"%@=%@", CookieName, CookieLogin] forHTTPHeaderField:@"Cookie"];
//    }
 [mgr.requestSerializer setValue:[NSString stringWithFormat:@"SERVERID=2019a9e14b1e4444b709a60fc1d7d7c6|1460605449|1460604558"] forHTTPHeaderField:@"Cookie"];    
    //发送get请求
    [mgr GET:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObj) {
        if (success) {
            NSError *err;
            NSString *string = [[NSString alloc] initWithData:responseObj encoding:NSUTF8StringEncoding];
            
            if(err) {
                NSLog(@"json解析失败：%@",err);
            }
            success(string);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
