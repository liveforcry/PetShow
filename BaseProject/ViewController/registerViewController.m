//
//  registerViewController.m
//  petShow
//
//  Created by baturu on 16/4/19.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "registerViewController.h"
#import <BmobSDK/Bmob.h>
#import "MedetilViewController.h"
@interface registerViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *userPasswdText;
@property (weak, nonatomic) IBOutlet UITextField *userPasswdText2;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;

@property (weak, nonatomic) IBOutlet UITextField *emIalNuber;
@end

@implementation registerViewController
- (IBAction)cancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    // Do any additional setup after loading the view.


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickRegister:(id)sender {
    if ([self.userNameText.text isEqualToString:@""]){
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"用户名不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alter show];
        return;
    }
    if ([self.userPasswdText.text isEqualToString:@""] || [self.userPasswdText2.text isEqualToString:@""]){
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"密码不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alter show];
        return;
    }
    if (![self.userPasswdText.text isEqualToString:self.userPasswdText2.text]){
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"输入的密码不一致！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alter show];
        return;
    }
    if ([self.emIalNuber.text isEqualToString:@""]){
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"邮箱不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alter show];
        return;
    }
    if ([self.phoneNumber.text isEqualToString:@""]){
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"电话号码不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alter show];
        return;
    }

    BmobUser *bUser = [[BmobUser alloc]init];
    [bUser setUsername:self.userNameText.text];
    [bUser setPassword:self.userPasswdText.text];

    [bUser setObject:self.phoneNumber.text forKey:@"tel"];
    [bUser setObject:self.emIalNuber.text forKey:@"Email"];
    [bUser signUpInBackgroundWithBlock:^(BOOL isSuccessful, NSError *error) {
        if (!isSuccessful) {
            if ([self.userNameText.text isEqualToString:@""] || [self.userPasswdText.text isEqualToString:@""]) {
                UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"用户名和密码不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alter show];
            }else{
                UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"用户名已存在，请重新输入！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alter show];
            }
        }else{
            //注册成功回到登录界面
//            [self.storyboard instantiateViewControllerWithIdentifier:@"loginVC"];
//            [self.navigationController popViewControllerAnimated:YES];
            [self.navigationController pushViewController:[[MedetilViewController alloc] init] animated:YES];
        }
    }];
}

/** 点击空白处收起键盘 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
