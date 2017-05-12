//
//  responseBuilder.h
//  tanghuangOA
//
//  Created by Crab on 2017/5/11.
//  Copyright © 2017年 ls. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    LeftContentType,
    CenterContentType,
    RightContentType
};

typedef NSInteger ButtonContentType;

@interface responseBuilder : NSObject
//普通的button
+ (UIButton*)buttonTitle:(NSString*)title frame:(CGRect)frame backgroundColor:(UIColor*)color target:(id)target selector:(SEL)selector;
//设置圆角边框的BUTTON
+ (UIButton*)radiusbuttonTitle:(NSString*)title frame:(CGRect)frame cornerRadius:(CGFloat)radius borderColor:(UIColor *)bordercolor borderWidth:(CGFloat)borderwidth backgroundColor:(UIColor*)color target:(id)target selector:(SEL)selector;
//高亮的button
+ (UIButton*)buttonNormalImage:(NSString*)imageName hightLightImage:(NSString*)hightImage frame:(CGRect)frame target:(id)target selector:(SEL)selector;

//选中的button
+ (UIButton*)buttonNormalImage:(NSString*)imageName selectImageName:(NSString*)selectImageName frame:(CGRect)frame target:(id)target selector:(SEL)selector;

//有图片和文字的按钮
+ (UIButton*)buttonNormalImage:(NSString *)imageName seletedImage:(NSString *)seletedImage title:(NSString *)titleName frame:(CGRect)frame target:(id)target selector:(SEL)selector directionType:(ButtonContentType)type;

//有边框的按钮.设置边框
+ (UIButton*)buttonFrame:(CGRect)frame title:(NSString*)title textColor:(UIColor*)textColor textFont:(UIFont*)font borderWidth:(CGFloat)width borderColor:(UIColor*)borderColor;

//lable
+ (UILabel*)lableFrame:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor*)color font:(UIFont*)font textColor:(UIColor*)textColor;

//imageview
+ (UIImageView*)imageViewFrame:(CGRect)frame imageName:(NSString*)imageName;

//lable lable的处理
+ (UILabel*)lableBackgroundcolor:(UIColor*)color;
@end
