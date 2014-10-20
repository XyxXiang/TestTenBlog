//
//  ViewController.m
//  TestTenBlog
//
//  Created by L'x on 14-10-20.
//  Copyright (c) 2014年 LittleX. All rights reserved.
//

#import "ViewController.h"
#import "constant.h"
#import "InfoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)actionLogin:(id)sender {
    [_weibo loginWithDelegate:self andRootController:self];
}

- (IBAction)actionLogout:(id)sender {
    [self.weibo cancelAuth];
}

- (IBAction)actionSendImg:(id)sender {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"json",@"format",
                                   @"调试腾讯微博ing",@"content",
                                   [UIImage imageNamed:@"img.jpg"],@"pic",
                                   nil];
    [self.weibo requestWithParams:params apiName:@"t/add_pic" httpMethod:@"POST" delegate:self];
                                   
    
}

- (IBAction)actionGetInfo:(id)sender {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"json",@"format",
                                                                                     @"0",@"pageflag",
                                                                                     @"30",@"reqnum",
                                                                                     @"0",@"type",
                                                                                     @"0",@"contenttype",
                                                                                     nil];
    [self.weibo requestWithParams:params apiName:@"statuses/home_timeline" httpMethod:@"GET" delegate:self];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self->_weibo = [[WeiboApi alloc] initWithAppKey:AppKey andSecret:AppSecret andRedirectUri:REDIRECTURI andAuthModeFlag:TCWBModelDefault andCachePolicy:TCWBCachePolicyCacheFirst];
    
}



#pragma mark - WeiboRequestDelegate

/**
 * @brief   接口调用成功后的回调
 * @param   INPUT   data    接口返回的数据
 * @param   INPUT   request 发起请求时的请求对象，可以用来管理异步请求
 * @return  无返回
 */
- (void)didReceiveRawData:(NSData *)data reqNo:(int)reqno
{
    NSLog(@"收到数据：%@",data);
    NSString *strData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"new :%@",strData);
//    NSError *err = nil;
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
//    NSDictionary *dic1 = dic[@"data"];
//    NSArray *arr1 = dic1[@"info"];
//    NSLog(@"%@",arr1[3]);
//    InfoViewController *infoVC = [[InfoViewController alloc] init];
//    infoVC.arrData = arr1;
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:infoVC];
//    [self presentViewController:nav animated:YES completion:nil];
}
/**
 * @brief   接口调用失败后的回调
 * @param   INPUT   error   接口返回的错误信息
 * @param   INPUT   request 发起请求时的请求对象，可以用来管理异步请求
 * @return  无返回
 */
- (void)didFailWithError:(NSError *)error reqNo:(int)reqno
{
    NSLog(@"请求出错了！ ： %@",error);
}


/**
 * @brief   调用接口，且失败原因为授权无效
 * @param   INPUT   error   接口返回的错误信息
 * @param   INPUT   request 发起请求时的请求对象，可以用来管理异步请求
 * @return  无返回
 */
- (void)didNeedRelogin:(NSError *)error reqNo:(int)reqno
{
    NSLog(@"授权无效，请重新授权！");
}


#pragma mark - WeiboAuthDelegate
/**
 * @brief   授权成功后的回调
 * @param   INPUT   wbapi 成功后返回的WeiboApi对象，accesstoken,openid,refreshtoken,expires 等授权信息都在此处返回
 * @return  无返回
 */
- (void)DidAuthFinished:(WeiboApiObject *)wbobj
{
    NSLog(@"授权完成！！！");
    NSString *str = [[NSString alloc]initWithFormat:@"accesstoken = %@\r\n openid = %@\r\n appkey=%@ \r\n appsecret=%@ \r\n refreshtoken=%@ ", wbobj.accessToken, wbobj.openid, wbobj.appKey, wbobj.appSecret, wbobj.refreshToken];
    NSLog(@"-----%@",str);
}

/**
 * @brief   授权成功后的回调
 * @param   INPUT   wbapi   weiboapi 对象，取消授权后，授权信息会被清空
 * @return  无返回
 */
- (void)DidAuthCanceled:(WeiboApiObject *)wbobj
{
    NSLog(@"授权取消！");
    
}

/**
 * @brief   授权成功后的回调
 * @param   INPUT   error   标准出错信息
 * @return  无返回
 */
- (void)DidAuthFailWithError:(NSError *)error
{
    NSLog(@"  ---  授权无效，请重新授权！");
}


/**
 * @brief   选择使用服务器验证token有效性（checkAuthValid）时，需实现此回调
 * @param   INPUT   bResult   检查结果，yes 为有效，no 为无效
 * @param   INPUT   strSuggestion 当bResult 为no 时，此参数为建议。
 * @return  无返回
 */
- (void)didCheckAuthValid:(BOOL)bResult suggest:(NSString*)strSuggestion
{
    NSLog(@"检查结果 : %d --   建议：%@",bResult,strSuggestion);
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
