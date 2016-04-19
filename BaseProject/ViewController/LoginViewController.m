//
//  LoginViewController.m
//  petShow
//
//  Created by baturu on 16/4/19.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "LoginViewController.h"
#import "MedetilViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end
@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(id)sender {
    NSString *name = self.nameTextField.text;
    NSString *password = self.passwordTextField.text;
[self loginBtnDidClick:name pwd:password];
//    [self loginBtnDidClick:@"15077833411" pwd:@"111111a"];
}

- (IBAction)gotoRegiester:(id)sender {
    
}

- (void)loginBtnDidClick:(NSString *)name pwd:(NSString *)pwd {
    //    [SVProgressHUD showWithStatus:@"正在登录..."];
    //    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    NSString *url = [NSString stringWithFormat:@"http://mobileapi.qipeipu.com/mobileapi/bs/userlg/login?account=%@&pwd=%@",  name, pwd];
    // 过滤到用户密码为空的情况
    if(name.length == 0 || pwd.length == 0)
    {
        NSString *str = @"用户名或密码为空, 请重新输入";
        [self useAlertWithMsg:str];
        return;
    }
    
    [BTLAllHttpTool loginWithUrl:url
                           Param:nil
                         success:^(BTLLoginResponse *response) {
                             //                response:  {"state":"0","name":"城","tel":"15077833411","cactMan":"张敏1","cactTel":"13802500397","countyId":"1674"} 新增了一个userId属性
                             
                             NSLog(@"%@, %@", response.msg, response.state);
                             
                             [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"RegisterSignupFlag"];
                             
                             //
                             NSLog(@"msg %@", response.msg);
                             
                             if ([response.state isEqualToString:@"0"]) {
                                 
                                 [self.navigationController pushViewController:[[MedetilViewController alloc] init] animated:YES];
                                 
                                 
                             } else{
                                 NSLog(@"账号密码问题 %@ ", response.msg);
                                 NSString *msg = response.msg;
                                 if (msg.length == 0 || msg.length > 50) {
                                     msg = @"网络问题，请稍后再试";
                                 }
                                 [self useAlertWithMsg:msg];
                                 
                             }
                         } failure:^(NSError *error) {
                             NSLog(@"登录失败 %@",error);
                             
                             NSString *str = @"网络问题，请稍后再试";
                             [self useAlertWithMsg:str];
                             
                         }];
}


- (void)useAlertWithMsg:(NSString *)msg
{
    //    [SVProgressHUD dismiss];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:msg message:nil delegate:self cancelButtonTitle:nil otherButtonTitles: @"确认", nil];
    //     alert.alertViewStyle =  UIAlertViewStyleLoginAndPasswordInput;
    alert.alertViewStyle = UIAlertActionStyleDefault;
    //    self.alert = alert;
    [alert show];
    
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
