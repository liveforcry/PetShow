//
//  AllPetsNewsViewModel.m
//  petShow
//
//  Created by baturu on 16/4/7.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "AllPetsNewsViewModel.h"
#import "AllNetManager.h"
#import "AllPetNewsModel.h"
@implementation AllPetsNewsViewModel

//刷新数据
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
   
}
//得到数据
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
 
    [AllNetManager getAllPetsNewsWithPageId:_pageId complete:^(AllPetNewsModel *model, NSError *error) {
        if (self.pageId == 0) {
            [self.dataArr removeAllObjects];
            self.dataArr = nil;
        }
     
        self.dataArr = [NSMutableArray arrayWithArray:model.data.list];
        _pageId = [model.data.page_id integerValue];
        completionHandle(error);
    }];
}
//加载更多
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    
    [self getDataFromNetCompleteHandle:completionHandle];
 
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
//获取每一行的数据
-(DataList *)getDataListForRow :(NSInteger)row{
    return self.dataArr[row];
    
}
-(NSURL *)getUsersUrlForRow : (NSInteger)row{
    return [NSURL URLWithString:[self getDataListForRow:row].user_info.avatar];
}
-(NSString *)getUserTitleForRow :(NSInteger)row{
    return [self getDataListForRow:row].user_info.nickname;
}
-(NSString *)getUserAddressForRow :(NSInteger)row{
      return [self getDataListForRow:row].user_info.address;
}

-(NSURL *)getUserLevelForRow :(NSInteger)row{
    return [NSURL URLWithString:[self getDataListForRow:row].user_info.level_icon];
}
-(NSString *)getPetNameForRow :(NSInteger)row{
      return [self getDataListForRow:row].user_info.nickname;
}
- (NSArray *)GetPhotoZanArrFroRow :(NSInteger) row{
  
    return [self getDataListForRow:row].zan_list;
}
-(BOOL)isOnePhotoForRow :(NSInteger)row{
     _PhtotCount = [self getDataListForRow:row].photo.count;
    _PhotoZanArr = [self getDataListForRow:row].zan_list;
    _PhtotZanCount = _PhotoZanArr.count;

    _height = [self getDataListForRow:row].height;
    if (_PhtotCount == 1) {
        return YES;
    }else{
       self.PhotoArr  = [self getDataListForRow:row].photo;
        return NO;
    }
}
 //只有一张的时候就返回 url 否则就返回nil
-(NSURL *)getPetPhotoUrlForRow :(NSInteger)row{
   return  [NSURL URLWithString:[self getDataListForRow:row].photo[0].url];
}
-(NSString *)getPetPhotoStrForRow :(NSInteger)row{
    return [self getDataListForRow:row].photo[0].url;
}
-(NSString *)getUserppidForRow :(NSInteger)row{
     return  [self getDataListForRow:row].ppid;
}
-(NSString *)getDecriptionForRow :(NSInteger)row{
        return  [self getDataListForRow:row].photo_des;
}
-(NSString *)getLikeNumForRow :(NSInteger)row{
     return  [self getDataListForRow:row].zan;
}
-(NSString *)getCommentNumForRow :(NSInteger)row{
//    [self.ZanUserArr addObjectsFromArray:[self getDataListForRow:row].zan_list];
   return  [self getDataListForRow:row].plnum;
}
@end
