//
//  RootViewController.m
//  UITableView
//
//  Created by Louis on 14-7-10.
//  Copyright (c) 2014年 Louis. All rights reserved.
//

#import "RootViewController.h"

// 导航栏bar的高度
#define kNavigationBarH 44

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"???";
    // 添加tableview
    // tableview的默认起点就是在bar的下面,这里不需要设置什么他的高度还是起始地点
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height ) style:UITableViewStylePlain];
    
    // 设置行高
    tableView.rowHeight = 40;
    
    // 设置分割线样式
    // UITableViewCellSeparatorStyleSingleLineEtched 只能用于group的
    //    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;  无效果。。。
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 设置分割线颜色
    tableView.separatorColor = [UIColor greenColor];
    tableView.backgroundColor = [UIColor redColor];

    // 设置代理
    tableView.delegate = self;
    tableView.dataSource = self;
    
    // 添加到主视图中
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text =  [NSString stringWithFormat:@"第%d行 第%d列",  indexPath.section, indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
