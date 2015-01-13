//
//  HomeViewController.m
//  PNotes
//
//  Created by lyn on 14-12-8.
//  Copyright (c) 2014年 lyn. All rights reserved.
//

#import "HomeViewController.h"
#import "PhotoCell.h"
#define RGB(a,b,c) [UIColor colorWithRed:a/255 green:b/255 blue:c/255 alpha:1.0]

@interface HomeViewController ()


@end

@implementation HomeViewController

static NSString * const reuseIdentifier = @"Cell";




- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(!cell)
    {
        cell = [[PhotoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        cell.backgroundColor = [UIColor whiteColor];
        //cell.contentView.backgroundColor = RGB(90, 90, 90);
    }
    NSLog(@"%p",cell);
    //NSLog(@"%@",cell.subviews);
    //cell.separatorInset = UIEdgeInsetsMake(10, 0, 0, 0);
    //tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.separatorColor = [UIColor clearColor];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (void)tableView: (UITableView*)tableView willDisplayCell: (UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath
{
    cell.backgroundColor = [UIColor whiteColor];
}

@end
