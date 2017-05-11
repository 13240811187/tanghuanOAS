

#import "XSIdentifiCollectionViewCell.h"

@interface XSIdentifiCollectionViewCell ()

@property (nonatomic,strong)UIImageView *identifiImage;

@property (nonatomic,strong)UILabel *firtL;

@property (nonatomic,strong)UILabel *secondL;


@end

@implementation XSIdentifiCollectionViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andIndexPath:(NSIndexPath *)indexPath{
    
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        
//        
//        
//    }
    
    return self;
    
    
}

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
