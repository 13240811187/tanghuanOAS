//
//  personViewController.m
//  tanghuangOA
//
//  Created by Orangels on 2017/5/11.
//  Copyright © 2017年 ls. All rights reserved.

//85 149 250
//97 196 252
//233 * 3

#import "personViewController.h"
#import "API.h"

#import <MessageUI/MessageUI.h>

@interface personViewController ()<UITableViewDelegate,UITableViewDataSource,MFMailComposeViewControllerDelegate>

@property (nonatomic ,strong)UITableView* tableView;

@end

@implementation personViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.name;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    [self creatUI];
}

- (void)creatUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    _tableView.rowHeight  = 50;
    _tableView.scrollEnabled = NO;
    UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-44*5-64-200)];
    footerView.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    _tableView.tableFooterView = footerView;
    _tableView.tableHeaderView = [self creatHeadView];
    [self.view addSubview:_tableView];
}

-(UIView*)creatHeadView{
    UIView* view  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
    CAGradientLayer* gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:85/255.0 green:149/255.0 blue:250/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:97/255.0 green:196/255.0 blue:252/255.0 alpha:1.0].CGColor];
    gradientLayer.locations     = @[@0.5,@1.0];
    gradientLayer.startPoint    = CGPointMake(0, 0);
    gradientLayer.endPoint      = CGPointMake(0, 1.0);
    gradientLayer.frame = view.frame;
    [view.layer addSublayer:gradientLayer];
    
    return view;
}

#pragma mark tableviewdelegate datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"部门";
            cell.detailTextLabel.text = @"技术部";
            break;
        case 1:
            cell.textLabel.text = @"职务";
            cell.detailTextLabel.text = @"开发工程师";
            break;
        case 2:
            cell.textLabel.text = @"手机";
            cell.detailTextLabel.text = @"13641183182";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 3:
            cell.textLabel.text = @"Email";
            cell.detailTextLabel.text = @"2306731274@qq.com";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 4:
            cell.textLabel.text = @"公司电话";
            cell.detailTextLabel.text = @"";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        default:
            break;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 2:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",[tableView cellForRowAtIndexPath:indexPath].detailTextLabel.text]] options:@{} completionHandler:nil];
            break;
        case 3:{
            //发邮件 跳转原生
//            NSString* urlStr = [NSString stringWithFormat:@"mailto:%@",[tableView cellForRowAtIndexPath:indexPath].detailTextLabel.text];
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr] options:@{} completionHandler:nil];
            //跳转 界面
            if ([MFMailComposeViewController canSendMail]) { // 用户已设置邮件账户
                [self sendEmailWithEmail:[tableView cellForRowAtIndexPath:indexPath].detailTextLabel.text]; // 调用发送邮件的代码
            }
        }
            break;
        case 4:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",[tableView cellForRowAtIndexPath:indexPath].detailTextLabel.text]] options:@{} completionHandler:nil];
            break;
        
        default:
            break;
    }
}

- (void)sendEmailWithEmail:(NSString*)email{
    MFMailComposeViewController *mailCompose = [[MFMailComposeViewController alloc] init];
    // 设置邮件代理
    [mailCompose setMailComposeDelegate:self];
    [mailCompose setToRecipients:@[email]];
    [self presentViewController:mailCompose animated:YES completion:nil];
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled: // 用户取消编辑
            NSLog(@"Mail send canceled...");
            break;
        case MFMailComposeResultSaved: // 用户保存邮件
            NSLog(@"Mail saved...");
            break;
        case MFMailComposeResultSent: // 用户点击发送
            NSLog(@"Mail sent...");
            break;
        case MFMailComposeResultFailed: // 用户尝试保存或发送邮件失败
            NSLog(@"Mail send errored: %@...", [error localizedDescription]);
            break;
    }
    
    // 关闭邮件发送视图
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
