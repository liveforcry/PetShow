//
//  PetPicModel.h
//  petShow
//
//  Created by baturu on 16/4/13.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "BaseModel.h"

@class Post_List,Pet,User;
@interface PetPicModel : BaseModel

@property (nonatomic, strong) NSArray<Post_List *> *post_list;

@property (nonatomic, assign) NSInteger response_status;

@end
@interface Post_List : NSObject

@property (nonatomic, assign) CGFloat last_newpost_update_time;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, assign) NSInteger hot;

@property (nonatomic, copy) NSString *last_newpost_id;

@property (nonatomic, copy) NSString *post_id;

@property (nonatomic, copy) NSString *last_newpost_url;

@property (nonatomic, copy) NSString *_id;

@property (nonatomic, assign) NSInteger species;

@property (nonatomic, strong) Pet *pet;

@property (nonatomic, assign) CGFloat create_time;

@property (nonatomic, assign) NSInteger gender;

@property (nonatomic, strong) User *user;

@end

@interface Pet : NSObject

@property (nonatomic, copy) NSString *pet_id;

@end

@interface User : NSObject

@property (nonatomic, copy) NSString *pic;

@end

