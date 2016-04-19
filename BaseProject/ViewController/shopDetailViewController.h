//
//  shopDetailViewController.h
//  petShow
//
//  Created by baturu on 16/4/19.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shopDetailViewController : UIViewController
- (id)initWithURL:(NSURL *)url;
@property(nonatomic,strong) NSURL *url;
@end
