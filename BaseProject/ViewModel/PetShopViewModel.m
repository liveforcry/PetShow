//
//  PetShopViewModel.m
//  petShow
//
//  Created by baturu on 16/4/15.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "PetShopViewModel.h"
#import "PetShopModel.h"
@implementation PetShopViewModel
//刷新数据
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    [self.dataTask cancel];
    _flag = YES;
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}
- (instancetype)init{
    if (self = [super init]) {
        _flag = YES;
    }
    return self;
}
//得到数据
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    
 self.dataTask = [AllNetManager getPetsShopWithPageId :_pageId complete:^(PetShopModel *model, NSError *error) {
        if (self.pageId == 1) {
            [self.dataArr removeAllObjects];
            self.dataArr = nil;
        }
     [self.dataArr addObjectsFromArray:model.data];
//        self.dataArr = [NSMutableArray arrayWithArray:model.data];
  
        if (_pageId == 1) {
            self.ZuiXinArr  = model.data;
        }
        completionHandle(error);
    }];
}
//加载更多
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
    if (_pageId == 4) {
        _flag = NO;
        UIAlertView *alett = [[UIAlertView alloc]initWithTitle:@"消息" message:@"没有数据了,刷新吧" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"返回", nil];
        [alett show];
        [self.dataTask cancel];
    }
}
-(NSInteger)rowNumber{
      NSLog(@"self.dataArr.cout = %ld",self.dataArr.count);
    return self.dataArr.count;
}
//获取每一行的数据
-(ShopData *)getDataListForRow :(NSInteger)row{
    return self.dataArr[row];
    
}

//用户的头像url
-(NSURL *)getPhotosUrlForRow : (NSInteger)row{
     return [NSURL URLWithString:[self getDataListForRow:row].icon];
}
//用户的名称
-(NSString *)getUserNickForRow : (NSInteger)row{
    
    return [self getDataListForRow:row].name;
    
}
//用户的内容个数
-(NSString *)getMoneyForRow : (NSInteger)row{
    return [NSString stringWithFormat:@"%ld",[self getDataListForRow:row].coinCount];
}
@end
