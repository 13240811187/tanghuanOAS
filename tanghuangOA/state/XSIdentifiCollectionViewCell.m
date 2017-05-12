

#import "XSIdentifiCollectionViewCell.h"

@interface XSIdentifiCollectionViewCell ()

@property (nonatomic,strong)UIImageView *identifiImage;

@property (nonatomic,strong)UILabel *firtL;

@property (nonatomic,strong)UILabel *secondL;


@end

@implementation XSIdentifiCollectionViewCell


- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    
    [self setUpContentView];
    
    [self configUI];
    
    return self;
}


//加载试图
- (void)setUpContentView{
    
    NSLog(@"加载试图");
   
    
    self.contentView.backgroundColor=BackGrouColor;

    self.showLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,self.contentView.width, self.contentView.height)];
    
    self.showLabel.font = [UIFont systemFontOfSize:24];
    self.showLabel.textAlignment = NSTextAlignmentCenter;
    self.showLabel.textColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.showLabel];
   
    
    
}

//布局
- (void)configUI
{
    NSLog(@"代码布局");
}

////更新数据
//- (void)updateMode:(XSBaseMode*)mode
//{
//    NSLog(@"更新数据");
//    
//}

@end
