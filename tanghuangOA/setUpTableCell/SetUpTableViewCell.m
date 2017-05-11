//
//  SetUpTableViewCell.m
//  红马在线
//
//  Created by Crab on 16/12/12.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import "SetUpTableViewCell.h"


@interface SetUpTableViewCell()

@property (nonatomic, strong) UILabel * setUpLabel;
@property (nonatomic, strong) UILabel * versionLabel;
@property (nonatomic, strong) UIView * bgView;
@property (nonatomic,strong)UIImageView * setImageView;
@end

@implementation SetUpTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andIndexPath:(NSIndexPath *)indexPath
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //cell 右边的箭头 (>)
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.backgroundColor = BackGrouColor;
          [self.contentView addSubview:self.bgView];
    
          [self.bgView addSubview:self.setUpLabel];
         [self.bgView addSubview:self.versionLabel];
          [self.bgView addSubview:self.setImageView];
       
             if (indexPath.row == 0) {
             self.setUpLabel.text = @"我的工资条";
           
self.setImageView.image = [UIImage imageNamed:@"mess.png"];
             }else if (indexPath.row ==1){
                 
                 self.setUpLabel.text = @"关于我们";
                 self.setImageView.image = [UIImage imageNamed:@"about.png"];
                 
             }else if (indexPath.row ==2){
        
                 self.setUpLabel.text = @"退出登录";
                 self.setImageView.image = [UIImage imageNamed:@"loginout.png"];
                
             }else if (indexPath.row ==3){
                
                 
                 //cell 右边的箭头 (>)
                 self.accessoryType = UITableViewCellAccessoryNone;
                 self.setUpLabel.text = @"软件版本";
                 self.versionLabel.text = @"版本号：1.0";
                 self.setImageView.image = [UIImage imageNamed:@"version.png"];
             }
                 
        
    }
    return self;
}



- (UIImageView *)setImageView{
    
    if (!_setImageView) {
        
        _setImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 55, 55)];
    }
    
    return _setImageView;
}

-(UILabel*)setUpLabel
{
    if (!_setUpLabel) {
        _setUpLabel = [[UILabel alloc] initWithFrame:CGRectMake(60,0,150,55)];
        _setUpLabel.font = [UIFont systemFontOfSize:18];
        _setUpLabel.textColor = [UIColor blackColor];
        
    }
    return _setUpLabel;
}

-(UILabel*)versionLabel
{
    if (!_versionLabel) {
        _versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(_setUpLabel.right-20,0,150,55)];
        _versionLabel.font = [UIFont systemFontOfSize:18];
        _versionLabel.textColor = [UIColor blackColor];
        
    }
    return _versionLabel;
}



-(UIView*)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(10,5,SCWIDTH-10-10,55)];
       
        _bgView.backgroundColor = [UIColor whiteColor];
      
    }
    return _bgView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
