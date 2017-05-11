

#import "ButtonClass.h"

@implementation ButtonClass

- (void)layoutSubviews {
    [super layoutSubviews];

}

-(void)addBottomBtnView{
    
    self.btnView =[[UIView alloc]initWithFrame:CGRectMake(0,self.frame.size.height, self.frame.size.width, 2)];
    
    
    self.btnView.backgroundColor=[UIColor grayColor];
    
    self.btnView.hidden=!self.selected;
    
    [self addSubview:self.btnView];
    
    
    
}

-(void)hiddenVeiw
{
    self.btnView.hidden=!self.selected;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
