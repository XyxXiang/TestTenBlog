//
//  ViewController.h
//  TestTenBlog
//
//  Created by L'x on 14-10-20.
//  Copyright (c) 2014年 LittleX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboApi.h"

@interface ViewController : UIViewController<WeiboAuthDelegate,WeiboRequestDelegate>

@property (strong, nonatomic) IBOutlet  UIButton     *btnLogin;
@property (strong, nonatomic) IBOutlet  UIView       *btnLogout;
@property (strong, nonatomic) IBOutlet UIButton *btnSendImg;


- (IBAction)actionLogin:(id)sender;
- (IBAction)actionLogout:(id)sender;
- (IBAction)actionGetInfo:(id)sender;


@property (nonatomic, strong) WeiboApi              * weibo;
- (IBAction)actionSendImg:(id)sender;


@end
