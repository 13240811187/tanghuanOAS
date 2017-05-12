//
//  responseBuilder.m
//  tanghuangOA
//
//  Created by Crab on 2017/5/11.
//  Copyright © 2017年 ls. All rights reserved.
//

#import "responseBuilder.h"

@implementation responseBuilder
+ (UIButton*)buttonTitle:(NSString*)title frame:(CGRect)frame backgroundColor:(UIColor*)color target:(id)target selector:(SEL)selector
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundColor:color];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}


+ (UIButton*)radiusbuttonTitle:(NSString*)title frame:(CGRect)frame cornerRadius:(CGFloat)radius borderColor:(UIColor *)bordercolor borderWidth:(CGFloat)borderwidth backgroundColor:(UIColor*)color target:(id)target selector:(SEL)selector
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundColor:color];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.cornerRadius = radius;
    btn.layer.masksToBounds = YES;
    btn.layer.borderColor =(__bridge CGColorRef _Nullable)(bordercolor);
    btn.layer.borderWidth =borderwidth;
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+ (UIButton*)buttonNormalImage:(NSString*)imageName hightLightImage:(NSString*)hightImage frame:(CGRect)frame target:(id)target selector:(SEL)selector
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    imageName ? [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal] : nil;
    
    hightImage ? [btn setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted] : nil;
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}


+ (UIButton*)buttonNormalImage:(NSString*)imageName selectImageName:(NSString*)selectImageName frame:(CGRect)frame target:(id)target selector:(SEL)selector
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    imageName ?  [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal] : nil;
    
    selectImageName ? [btn setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected] : nil;
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+ (UIButton*)buttonNormalImage:(NSString *)imageName seletedImage:(NSString *)seletedImage title:(NSString *)titleName frame:(CGRect)frame target:(id)target selector:(SEL)selector directionType:(ButtonContentType)type
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor clearColor]];
    
    [btn setTitle:titleName forState:UIControlStateNormal];
    [btn setTitle:titleName forState:UIControlStateSelected];
    
    
    UIImage *normalImage=[UIImage imageNamed:imageName];
    UIImage *slectedImg=[UIImage imageNamed:seletedImage];
    
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn setImage:slectedImg forState:UIControlStateSelected];
    [btn setFrame:frame];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    if (type==LeftContentType) {// 内容在左边
        
        btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 16, 0, 0)];
        
    }else if (type==CenterContentType){// 内容在中间
        
        //btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
        //[btn setImageEdgeInsets:UIEdgeInsetsMake(17, 12, 48, 17)];
        //[btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, -40, 0)];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, -10.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
        
        [btn setImageEdgeInsets:UIEdgeInsetsMake(-20.0, 0.0,0.0, -54)];//图片距离右边框距离减少图片的宽度，其它不边
        
        //btn.titleLabel.font=Font(13);
        
        
        
    }else{//内容在右边
        
        btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;
        
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 6)];
        
    }
    
    return btn;
    
}

+ (UIButton*)buttonFrame:(CGRect)frame title:(NSString*)title textColor:(UIColor*)textColor textFont:(UIFont*)font borderWidth:(CGFloat)width borderColor:(UIColor*)borderColor
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor clearColor]];
    
    [btn setFrame:frame];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateSelected];
    
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    
    btn.titleLabel.font=font;
    
    btn.layer.borderWidth=width;
    btn.layer.borderColor=borderColor.CGColor;
    
    return btn;
    
}



+ (UILabel*)lableFrame:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor*)color font:(UIFont*)font textColor:(UIColor*)textColor
{
    UILabel *lable=[[UILabel alloc]initWithFrame:frame];
    lable.text=title;
    lable.font=font;
    [lable setBackgroundColor:color];
    lable.lineBreakMode=NSLineBreakByWordWrapping;
    lable.textColor=textColor;
    return lable;
    
}

+ (UIImageView*)imageViewFrame:(CGRect)frame imageName:(NSString*)imageName
{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:frame];
    [imageView setImage:[UIImage imageNamed:imageName]];
    imageView.contentMode=UIViewContentModeScaleAspectFill;
    imageView.userInteractionEnabled=YES;
    return imageView;
}

//lable
+ (UILabel*)lableBackgroundcolor:(UIColor*)color
{
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectZero];
    lable.text=nil;
    lable.font=nil;
    [lable setBackgroundColor:color];
    lable.lineBreakMode=NSLineBreakByWordWrapping;
    lable.textColor=nil;
    return lable;
    
}

@end
