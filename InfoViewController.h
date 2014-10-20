//
//  InfoViewController.h
//  TestTenBlog
//
//  Created by L'x on 14-10-20.
//  Copyright (c) 2014年 LittleX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface InfoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
}

@property (nonatomic, strong) NSArray * arrData;

@end
