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
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height ) style:UITableViewStyleGrouped];
    
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

#pragma mar - 设置右边的索引条
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    // 超出个数的那些东东他不会相应
    return [NSArray arrayWithObjects:@"A",@"B", @"C", @"D",@"E", nil];
}

#pragma mark - 设置secion头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
        return @"这个是头部";
}

#pragma mark - 设置section的尾部
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"这个是尾部";
}

#pragma mark   - 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

#pragma mark -设置缩进级别
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row %2) {
        return 12;
    }
    
    return 20;
}

#pragma mark - 设置section的view，但是这个view默认是居中的，估计有方法设置吧
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.bounds = CGRectMake(0, 0, 100, 100);
    return btn;
}
@end
