//
//  mineViewController.h
//  tanghuangOA
//
//  Created by Orangels on 2017/5/4.
//  Copyright © 2017年 ls. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    myNewsCV,
    MywebViewCV,
    SignOut,
    version
}CV;
@interface mineViewController : UIViewController

@property (nonatomic,copy)void(^MineBlock)(NSArray * dataArray);
@end
