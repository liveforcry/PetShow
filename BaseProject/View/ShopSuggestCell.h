//
//  ShopSuggestCell.h
//  petShow
//
//  Created by baturu on 16/4/15.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PetShopViewModel.h"
@interface ShopSuggestCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UICollectionView *collectionVeiw;
@property(nonatomic,strong)NSArray *phtot;
@property(nonatomic,strong)PetShopViewModel *shopVm;
@property(nonatomic,assign)NSInteger phtotCount;
@end
