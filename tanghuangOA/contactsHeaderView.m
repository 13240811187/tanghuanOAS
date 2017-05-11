//
//  contactsHeaderView.m
//  tanghuangOA
//
//  Created by Orangels on 2017/5/5.
//  Copyright © 2017年 ls. All rights reserved.
//

#import "contactsHeaderView.h"

@implementation contactsHeaderView

-(void)awakeFromNib{
    [super awakeFromNib];
    // Initialization code
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    [self addGestureRecognizer:tap];
    self.contactsImageView.image = [UIImage imageNamed:@"arrow_down"];
    self.contentView.backgroundColor = [UIColor orangeColor];
}

-(void)setIsExpanded:(BOOL)isExpanded{
    if (_isExpanded != isExpanded) {
        _isExpanded = isExpanded;
    }
    //因为这里会多次调用,所以在点击方法触发动画以后,还会触发这个方法,所以这里也要做动画处理
    [UIView animateWithDuration:0.25 animations:^{
        if (_isExpanded) {
            self.contactsImageView.transform = CGAffineTransformIdentity;
        }else{
            self.contactsImageView.transform = CGAffineTransformMakeRotation(-M_PI_2);
        }
    }];
    
//    if (_isExpanded) {
//        self.contactsImageView.transform = CGAffineTransformIdentity;
//    }else{
//        self.contactsImageView.transform = CGAffineTransformMakeRotation(-M_PI_2);
//    }
    
    
}

-(void)click:(UITapGestureRecognizer*)tap{
    self.isExpanded = !self.isExpanded;
    [UIView animateWithDuration:0.25 animations:^{
        if (_isExpanded) {
            self.contactsImageView.transform = CGAffineTransformIdentity;
        }else{
            self.contactsImageView.transform = CGAffineTransformMakeRotation(-M_PI_2);
        }
    }];
    
    self.tapHandler(self.isExpanded);
}











/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
