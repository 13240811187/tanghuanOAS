//
//  MineDetailsView.m
//  tanghuangOA
//
//  Created by Crab on 2017/5/11.
//  Copyright © 2017年 ls. All rights reserved.
//

#import "MineDetailsView.h"
#import "MineDetailsTableViewCell.h"
@interface MineDetailsView ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation MineDetailsView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.tableView];
       
        
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
        _tableView.rowHeight = 180;
        
        
    }
    return _tableView;
    
}


//返回小组内 cell 的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *giftCellIdentify = @"MineDetailsTableViewCell";
    MineDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:giftCellIdentify];
    if (!cell) {
        
        cell = [[MineDetailsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:giftCellIdentify andIndexPath:indexPath];
    }
    
        mineModel * model = self.dataArray[indexPath.row];
    
        cell.minemodel = model;
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%ld",indexPath.row);
        
}







@end
