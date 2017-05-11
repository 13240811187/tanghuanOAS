//
//  SetUpTableView.h
//  红马在线
//
//  Created by Crab on 16/12/12.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mineViewController.h"

@class SetUpTableView;
@protocol setUpViewDelegate <NSObject>

- (void)MySetViewController:(id)sender indexPath:(NSInteger)index;
@end
@interface SetUpTableView : UIView
@property (nonatomic, assign)id<setUpViewDelegate>delegate;
@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)UIView * headerView;
@property (nonatomic,strong)UILabel * userLabel;
@property (nonatomic,strong)UIImageView * userImage;
@property (nonatomic,strong)UILabel * PhoneLabel;
@end
