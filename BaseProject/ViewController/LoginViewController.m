//
//  LoginViewController.m
//  petShow
//
//  Created by baturu on 16/4/19.
//  Copyright © 2016年 shenyi. All rights reserved.
//
#import <BmobSDK/Bmob.h>
#import "LoginViewController.h"
#import "MedetilViewController.h"
#import "UMSocial.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end
@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//微博登入
- (IBAction)weiboLogin:(id)sender {
    
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId);
            [self.navigationController pushViewController:[[MedetilViewController alloc] initWithName:snsAccount.userName icon:snsAccount.iconURL]  animated:NO];
        }});
    
}
//微信登入
- (IBAction)weixinLogin:(id)sender {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary]valueForKey:UMShareToWechatSession];
            
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId);
            [self.navigationController pushViewController:[[MedetilViewController alloc] initWithName:snsAccount.userName icon:snsAccount.iconURL]  animated:NO];
        }
        
    });
}
- (IBAction)renrenLogin:(id)sender {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToRenren];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId);
           [self.navigationController pushViewController:[[MedetilViewController alloc] initWithName:snsAccount.userName icon:snsAccount.iconURL]  animated:NO];
        }});
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(id)sender {
//    NSString *name = self.nameTextField.text;
//    NSString *password = self.passwordTextField.text;
////[self loginBtnDidClick:name pwd:password];
//    [self loginBtnDidClick:@"15077833411" pwd:@"111111a"];
    if ([self.nameTextField.text isEqualToString:@""] || [self.passwordTextField.text isEqualToString:@""]) {
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"登录失败" message:@"用户名和密码不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alter show];
        return;
    }
   
    [BmobUser loginWithUsernameInBackground:self.nameTextField.text password:self.
     passwordTextField.text block:^(BmobUser *user, NSError *error) {
        if (error) {
        
            UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"登录失败" message:@"请输入正确的用户名和密码！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alter show];
        }else{
            NSLog(@"登录成功");
            //登录成功后
//            YJLoginUserViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"userVC"];
//            [self.navigationController pushViewController:vc animated:YES];
            
//            [self.navigationController pushViewController:[[MedetilViewController alloc] initWithName:self.nameTextField.text] animated:YES];
               [self.navigationController pushViewController:[[MedetilViewController alloc] initWithName:self.nameTextField.text icon:nil]  animated:NO];
        }
    }];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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



@end
