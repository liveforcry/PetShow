//
//  BaseNetManager.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

static AFHTTPSessionManager *manager = nil;

@implementation BaseNetManager

+ (AFHTTPSessionManager *)sharedAFManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain",@"application/text", nil];
    });
    return manager;
}
+(id)GetMakeOwn:(NSString *)path parameters:(NSDictionary *)params completeHandle:(void(^)(id responseObj, NSError *error))complete{
    //拼接请求字符串 服务器地址?值=value&值=value......
    NSMutableString *requestPath=[NSMutableString new];
    [requestPath appendString:path];
    [requestPath appendString:@"?"];
    //字典自带的遍历方法，等同于forin
    [params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        //   拼接为key=value&
        NSString *str=[NSString stringWithFormat:@"%@=%@&", key,obj];
        [requestPath appendString:str];
    }];
    
    NSURLSessionDataTask *task=[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:requestPath] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            complete(nil, error);
        }else{
            NSError *error1 = nil;
            //解析时，不规定解析什么
            　NSString *aString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            aString =  [aString stringByReplacingOccurrencesOfString:@"(" withString:@""];
            aString = [aString stringByReplacingOccurrencesOfString:@")" withString:@""];
            NSData *data =[aString dataUsingEncoding:NSUTF8StringEncoding];
            id responseObj=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments error:&error1];
            
            if (error1) {
                complete(nil, error1);
            }else{
                complete(responseObj, nil);
            }
        }
    }];
    [task resume];
    return task;

}
+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    //打印网络请求， DDLog  与  NSLog 功能一样
    DDLogVerbose(@"Request Path: %@, params %@", path, params);
    return [[self sharedAFManager] GET:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        complete(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    return [[self sharedAFManager] POST:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        [self handleError:error];
        complete(nil, error);
    }];
}

+ (NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params{
    NSMutableString *percentPath =[NSMutableString stringWithString:path];
    NSArray *keys = params.allKeys;
    NSInteger count = keys.count;
    for (int i = 0; i < count; i++) {
        if (i == 0) {
            [percentPath appendFormat:@"?%@=%@", keys[i], params[keys[i]]];
        }else{
            [percentPath appendFormat:@"&%@=%@", keys[i], params[keys[i]]];
        }
    }
    return [percentPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+ (void)handleError:(NSError *)error{
    [[self new] showErrorMsg:error]; //弹出错误信息
}

@end
