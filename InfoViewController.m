//
//  InfoViewController.m
//  TestTenBlog
//
//  Created by L'x on 14-10-20.
//  Copyright (c) 2014年 LittleX. All rights reserved.
//

#import "InfoViewController.h"
#import "UIImageView+WebCache.h"

@interface InfoViewController ()
{
    UILabel *lbltext;
    UILabel *lblnick;
    UILabel *lblname;
    //UILabel *lblnick;
    UIImageView *imgvIcon;
}

@end

@implementation InfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark - TabelViewDataSource



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"TestTenWeiboCell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        lbltext = [[UILabel alloc] initWithFrame:CGRectMake(3, 33, 300, 60)];
        lbltext.font = [UIFont systemFontOfSize:10.0];
        lbltext.numberOfLines = 0;
        lblnick = [[UILabel alloc] initWithFrame:CGRectMake(83, 3, 100, 40)];
        lblnick.font = [UIFont systemFontOfSize:11.0];
        //lblname = [[UILabel alloc] initWithFrame:CGRectMake(3, 3, 100, 40)];
        
        imgvIcon = [[UIImageView alloc] initWithFrame:CGRectMake(2, 2, 50, 50)];
        imgvIcon.backgroundColor = [UIColor orangeColor];
        
        [cell addSubview:lbltext];
        [cell addSubview:lblnick];
        //[cell addSubview:lblname];
        [cell addSubview:imgvIcon];
    }
//    __string(from);
//    __string(fromurl);
//    __string(https_head);
//    __string(image);
//    __string(name);
//    __string(nick);
//    __string(origtext);
//    __string(readcount);
//    __string(text);
    
    lbltext.text = nil;
    lblnick.text = nil;
    
    
    DataModel *model = [[DataModel alloc] init];
    [model setValuesForKeysWithDictionary:_arrData[indexPath.row]];
    
    
    lbltext.text = model.text;
    
    
    NSLog(@"\n\n\n%@",model.text);
    
    lblnick.text = model.nick;
    
    
    //lblname.text = model.name;
    
    [imgvIcon setImageWithURL:[NSURL URLWithString:model.https_head]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
