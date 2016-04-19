//
//  ShopSuggestCell.h
//  petShow
//
//  Created by baturu on 16/4/15.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PetShopViewModel.h"

@class ShopSuggestCell;
@protocol shopSuggestCellDelegate <NSObject>

-(void)gotoDetailGoods :(ShopSuggestCell *)cell url :(id)url;

@end

@interface ShopSuggestCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UICollectionView *collectionVeiw;
@property(nonatomic,strong)NSArray *phtot;
@property(nonatomic, weak) id<shopSuggestCellDelegate> delegate;
-(void)dealWithDataCell1 : (PetShopViewModel *)PetVM row : (NSInteger)row;

@property(nonatomic,assign)NSInteger phtotCount;
@end
