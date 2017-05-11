//
//  SetUpTableView.m
//  红马在线
//
//  Created by Crab on 16/12/12.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import "SetUpTableView.h"
#import "SetUpTableViewCell.h"
@interface SetUpTableView ()<UITableViewDataSource,UITableViewDelegate>


@end
@implementation SetUpTableView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
         [self addSubview:self.tableView];
        self.tableView.tableHeaderView = self.headerView;
        [self.headerView addSubview:self.userImage];
        
        [self.headerView addSubview:self.userLabel];
        
        [self.headerView addSubview:self.PhoneLabel];
        

    }
    return self;
}






- (UITableView *)tableView{

    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, SCWIDTH, SCHEIGHT) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor =BackGrouColor;
        _tableView.separatorStyle = NO;
        _tableView.rowHeight = 65;
        
       
    }
    return _tableView;

}

- (UIView *)headerView{
    
    if (!_headerView) {
        
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCWIDTH,65)];
        _headerView.backgroundColor = [UIColor whiteColor];
        
//        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//        
//        NSString * userId =  [user objectForKey:@"userId"];
        
       
    }
    
    return _headerView;
    
}

- (UIImageView *)userImage{
    
    if (!_userImage) {
        
        _userImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 65,65)];
        _userImage.image = [UIImage imageNamed:@"picon.jpg"];
    }
    
    return _userImage;
    
}



-(UILabel*)userLabel
{
    if (!_userLabel) {
        _userLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.userImage.right+10,0,200,30)];
        _userLabel.font = [UIFont systemFontOfSize:15];
        _userLabel.textColor = [UIColor blackColor];
        
        _userLabel.backgroundColor = [UIColor whiteColor];
      

    }
    return _userLabel;
}


-(UILabel*)PhoneLabel
{
    if (!_PhoneLabel) {
        _PhoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.userImage.right+10,_userLabel.bottom+5,200,30)];
        _PhoneLabel.font = [UIFont systemFontOfSize:15];
        _PhoneLabel.textColor = [UIColor blackColor];
        
        _PhoneLabel.backgroundColor = [UIColor whiteColor];
        
        
    }
    return _PhoneLabel;
}





//返回小组内 cell 的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *giftCellIdentify = @"setuptableView";
    SetUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:giftCellIdentify];
    if (!cell) {
        
      cell = [[SetUpTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:giftCellIdentify andIndexPath:indexPath];
    }
    
//    mineModel * model = self.dataArray[indexPath.row];
//    
//    cell.model = model;
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row==0) {
       
   
        if([self.delegate respondsToSelector:@selector(MySetViewController:indexPath:)])
        {
            [self.delegate MySetViewController:self indexPath:indexPath.row];
        }
        
        

    }else if (indexPath.row==1){
        
        if([self.delegate respondsToSelector:@selector(MySetViewController:indexPath:)])
        {
            [self.delegate MySetViewController:self indexPath:indexPath.row];
        }
 
            
    }else if (indexPath.row ==2){
        
        if([self.delegate respondsToSelector:@selector(MySetViewController:indexPath:)])
        {
            [self.delegate MySetViewController:self indexPath:indexPath.row];
        }
    
        
    }else if (indexPath.row==3){
        
        if([self.delegate respondsToSelector:@selector(MySetViewController:indexPath:)])
        {
            [self.delegate MySetViewController:self indexPath:indexPath.row];
        }
        

        
    }
    
    
    
}





@end
