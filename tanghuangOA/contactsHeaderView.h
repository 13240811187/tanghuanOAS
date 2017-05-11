//
//  contactsHeaderView.h
//  tanghuangOA
//
//  Created by Orangels on 2017/5/5.
//  Copyright © 2017年 ls. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tapBlock)(BOOL isExpanded);

@interface contactsHeaderView : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UIImageView *contactsImageView;
@property (weak, nonatomic) IBOutlet UILabel *contactsTextLabel;
@property (copy ,nonatomic) tapBlock tapHandler;
@property (nonatomic)BOOL isExpanded;
@end
