//
//  fatherViewController.h
//  tanghuangOA
//
//  Created by Crab on 2017/5/11.
//  Copyright © 2017年 ls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fatherViewController : UIViewController
//设置导航栏左边和右边的按钮图片,如果为nil的话，就是空，
- (void)setLeftBarItemImageName:(NSString*)leftImageName rightBarItemImageName:(NSString*)rightImageName;

//单设置右边
- (void)setRightItemImageName:(NSString*)imageName;

//单设置左边

- (void)setLeftItemImageName:(NSString *)imageName;

//设置导航栏右侧多个按钮
- (void)setRightItemsImageNames:(NSArray *)imageNames;

//左边点击事件
- (void)navibarLeftBtnClick:(UIButton*)leftBtn;

// 是字不是图片的
- (void)setLeftItemTitleName:(NSString *)title;

- (void)setRightItemTitleName:(NSString *)title;
@end
