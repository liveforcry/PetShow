//
//  shopAllViewCell.h
//  petShow
//
//  Created by baturu on 16/4/19.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PetShopViewModel.h"
@class shopAllViewCell;
@protocol shopAllViewCellDelegate <NSObject>

-(void)gotoDetailGoods :(shopAllViewCell *)cell url :(id)url;

@end

@interface shopAllViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UICollectionView *collectionVeiw;
@property(nonatomic,strong)NSArray *phtot;
@property(nonatomic, weak) id<shopAllViewCellDelegate> delegate;
-(void)dealWithDataCell2 : (PetShopViewModel *)PetVM row : (NSInteger)row;
@property(nonatomic,assign)NSInteger phtotCount;
@end
