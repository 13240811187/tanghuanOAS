//
//  MineDetailsTableViewCell.h
//  tanghuangOA
//
//  Created by Crab on 2017/5/11.
//  Copyright © 2017年 ls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mineModel.h"
@interface MineDetailsTableViewCell : UITableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andIndexPath:(NSIndexPath *)indexPath;
@property (nonatomic,strong)mineModel * minemodel;
@end
