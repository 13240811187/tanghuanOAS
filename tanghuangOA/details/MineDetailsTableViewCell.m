//
//  MineDetailsTableViewCell.m
//  tanghuangOA
//
//  Created by Crab on 2017/5/11.
//  Copyright © 2017年 ls. All rights reserved.
//

#import "MineDetailsTableViewCell.h"
@interface MineDetailsTableViewCell()
@property (nonatomic, strong) UIView * bgView;
@property (nonatomic,strong)UILabel * create_timeLabel;//工资时间
@property (nonatomic,strong)UILabel * card_numLabel;//银行卡号
@property (nonatomic,strong)UILabel * basic_wageLabel;//基本工资(请除以1000后使用)

@property (nonatomic,strong)UILabel * fineLabel;// 罚款金额(请除以1000后使用)
@property (nonatomic,strong)UILabel * income_taxLabel;// 个人所得税金额(请除以1000后使用)
@property (nonatomic,strong)UILabel * insuranceLabel;//五险金额

@property (nonatomic,strong)UILabel * rewardLabel;//奖励金额

@property (nonatomic,strong)UILabel * subsidyLabel;//补助金额(金额

@property (nonatomic,strong)UILabel * write_offLabel;//报销金额金额

@property (nonatomic,strong)UILabel * actual_issueLabel;//实收工资金额
@end
@implementation MineDetailsTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andIndexPath:(NSIndexPath *)indexPath
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //cell 右边的箭头 (>)
        //self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.backgroundColor = BackGrouColor;
       [self.contentView addSubview:self.bgView];
        [self.bgView addSubview:self.create_timeLabel];
         [self.bgView addSubview:self.card_numLabel];
        
         [self.bgView addSubview:self.basic_wageLabel];
        
         [self.bgView addSubview:self.fineLabel];
        
         [self.bgView addSubview:self.income_taxLabel];
        
         [self.bgView addSubview:self.insuranceLabel];
        
         [self.bgView addSubview:self.rewardLabel];
         [self.bgView addSubview:self.subsidyLabel];
         [self.bgView addSubview:self.write_offLabel];
         [self.bgView addSubview:self.actual_issueLabel];
        
    }
    return self;
}

- (void)setMinemodel:(mineModel *)minemodel{
    
        self.create_timeLabel.text = [NSString stringWithFormat:@"%@",minemodel.create_time];
     self.card_numLabel.text = [NSString stringWithFormat:@"卡号:%ld",(long)minemodel.card_num/100];
    
    float basic_wages = minemodel.basic_wage/100;
     self.basic_wageLabel.text = [NSString stringWithFormat:@"基本工资:%2.f",basic_wages];
    
    float fines = minemodel.fine/100;
    self.fineLabel.text = [NSString stringWithFormat:@"罚款金额:%2.f",fines];
    
    
    float income_taxs = minemodel.income_tax/100;
    self.income_taxLabel.text = [NSString stringWithFormat:@"个人交税:%2.f",income_taxs];
    

    float insurances = minemodel.insurance/100;
    self.insuranceLabel.text = [NSString stringWithFormat:@"五险金额:%2.f",insurances];
    

    float rewards = minemodel.reward/100;
    self.rewardLabel.text = [NSString stringWithFormat:@"奖励金额:%2.f",rewards];
    
    
    float subsidys = minemodel.subsidy/100;
    self.subsidyLabel.text = [NSString stringWithFormat:@"补助金额:%2.f",subsidys];
    
    
    float write_offs = minemodel.write_off/100;
    self.write_offLabel.text = [NSString stringWithFormat:@"报销金额:%2.f",write_offs];
    
    
    float actual_issues = minemodel.actual_issue/100;
    self.actual_issueLabel.text = [NSString stringWithFormat:@"实收工资:%2.f",actual_issues];
    



    
}

-(UIView*)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(10,5,SCWIDTH-10-10,170)];
        
        _bgView.backgroundColor = [UIColor whiteColor];
        
    }
    return _bgView;
}


-(UILabel*)create_timeLabel
{
    if (!_create_timeLabel) {
        _create_timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,150,30)];
        _create_timeLabel.font = [UIFont systemFontOfSize:15];
        _create_timeLabel.textColor = [UIColor blackColor];
        //_create_timeLabel.backgroundColor = [UIColor redColor];
    }
    return _create_timeLabel;
}

-(UILabel*)card_numLabel
{
    if (!_card_numLabel) {
        _card_numLabel = [[UILabel alloc] initWithFrame:CGRectMake(_create_timeLabel.right+5,0,SCWIDTH-20-5-_create_timeLabel.width,30)];
        _card_numLabel.font = [UIFont systemFontOfSize:12];
        _card_numLabel.textColor = [UIColor blackColor];
        //_card_numLabel.backgroundColor = [UIColor redColor];

        
        
    }
    return _card_numLabel;
}


-(UILabel*)basic_wageLabel
{
    if (!_basic_wageLabel) {
        _basic_wageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,_create_timeLabel.bottom+5,_bgView.width/2-5,30)];
        _basic_wageLabel.font = [UIFont systemFontOfSize:15];
        _basic_wageLabel.textColor = [UIColor blackColor];
        
        //_basic_wageLabel.backgroundColor = [UIColor redColor];
        
    }
    return _basic_wageLabel;
}


-(UILabel*)fineLabel
{
    if (!_fineLabel) {
        _fineLabel = [[UILabel alloc] initWithFrame:CGRectMake(_basic_wageLabel.right+5,_basic_wageLabel.y,_bgView.width/2-5,30)];
        _fineLabel.font = [UIFont systemFontOfSize:15];
        _fineLabel.textColor = [UIColor blackColor];
       // _fineLabel.backgroundColor = [UIColor redColor];
        
    }
    return _fineLabel;
}


-(UILabel*)income_taxLabel
{
    if (!_income_taxLabel) {
        _income_taxLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,_basic_wageLabel.bottom+5,_bgView.width/2-5,30)];
        _income_taxLabel.font = [UIFont systemFontOfSize:15];
        _income_taxLabel.textColor = [UIColor blackColor];
        //_income_taxLabel.backgroundColor = [UIColor redColor];
        
    }
    return _income_taxLabel;
}

-(UILabel*)insuranceLabel
{
    if (!_insuranceLabel) {
        _insuranceLabel = [[UILabel alloc] initWithFrame:CGRectMake(_income_taxLabel.right+5,_income_taxLabel.y,_bgView.width/2-5,30)];
        _insuranceLabel.font = [UIFont systemFontOfSize:15];
        _insuranceLabel.textColor = [UIColor blackColor];
        //_insuranceLabel.backgroundColor = [UIColor redColor];
        
    }
    return _insuranceLabel;
}

-(UILabel*)rewardLabel
{
    if (!_rewardLabel) {
        _rewardLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,_insuranceLabel.bottom+5,_bgView.width/2-5,30)];
        _rewardLabel.font = [UIFont systemFontOfSize:15];
        _rewardLabel.textColor = [UIColor blackColor];
        //_rewardLabel.backgroundColor = [UIColor redColor];
        
    }
    return _rewardLabel;
}


-(UILabel*)subsidyLabel
{
    if (!_subsidyLabel) {
        _subsidyLabel = [[UILabel alloc] initWithFrame:CGRectMake(_rewardLabel.right+5,_rewardLabel.y,_bgView.width/2-5,30)];
        _subsidyLabel.font = [UIFont systemFontOfSize:15];
        _subsidyLabel.textColor = [UIColor blackColor];
        //_subsidyLabel.backgroundColor = [UIColor redColor];
        
    }
    return _subsidyLabel;
}

-(UILabel*)write_offLabel
{
    if (!_write_offLabel) {
        _write_offLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,_subsidyLabel.bottom+5,_bgView.width/2-5,30)];
        _write_offLabel.font = [UIFont systemFontOfSize:15];
        _write_offLabel.textColor = [UIColor blackColor];
        //_write_offLabel.backgroundColor = [UIColor redColor];
        
    }
    return _write_offLabel;
}

-(UILabel*)actual_issueLabel
{
    if (!_actual_issueLabel) {
        _actual_issueLabel = [[UILabel alloc] initWithFrame:CGRectMake(_write_offLabel.right+5,_write_offLabel.y,_bgView.width/2-5,30)];
        _actual_issueLabel.font = [UIFont systemFontOfSize:15];
        _actual_issueLabel.textColor = [UIColor blackColor];
        //  _actual_issueLabel.backgroundColor = [UIColor redColor];
        
    }
    return _actual_issueLabel;
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
