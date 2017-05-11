//
//  mineModel.h
//  tanghuangOA
//
//  Created by Crab on 2017/5/11.
//  Copyright © 2017年 ls. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mineModel : NSObject
@property(nonatomic,assign)NSInteger actual_issue;//实收工资金额(请除以1000后使用)

@property(nonatomic,assign)NSInteger basic_wage;//基本工资(请除以1000后使用)
@property(nonatomic,strong)NSString  * create_time;// // 创建时间
@property(nonatomic,assign)NSInteger card_num; //银行卡号

@property(nonatomic,assign)NSInteger department_id;//部门id

@property(nonatomic,assign)NSInteger fine;//// 罚款金额(请除以1000后使用)

@property(nonatomic,assign)NSInteger income_tax;// // 个人所得税金额(请除以1000后使用)
@property(nonatomic,assign)NSInteger insurance; // 五险金额(请除以1000后使用)
@property(nonatomic,assign)NSInteger others;//// 其他金额(请除以1000后使用
@property(nonatomic,assign)NSInteger provident_fund;

@property(nonatomic,assign)NSInteger reward;//// 奖励金额(请除以1000后使用)
@property(nonatomic,assign)NSInteger subsidy;//// 补助金额(请除以1000后使用)
@property(nonatomic,assign)NSInteger user_id;//// 用户id
@property(nonatomic,assign)NSInteger write_off;//// 报销金额(请除以1000后使用)


@end
