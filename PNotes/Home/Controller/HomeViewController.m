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
@property (nonatomic,copy) NSArray* textArray;
@end

@implementation HomeViewController

static NSString * const reuseIdentifier = @"Cell";

- (NSArray*) textArray
{
    if (!_textArray) {
        self.textArray = @[@"镜头前的自己不知羞涩好久不见得英杰传、、好噶哈哈接啊接啊接啊接啊就",@"的讲课老师的房价很快很快和空间十分的开发和回复开始的话 ",@"哈哈哈哈哈哈哈哈哈哈哈",@"角度讲的角度讲的角度讲大家的基督教"];
    }
    return _textArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tableView.backgroundColor = [UIColor whiteColor];
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
        cell.backgroundColor = [UIColor lightGrayColor];
       
    }
    PhotoModel *model = [[PhotoModel alloc] init];
    model.pic_urls =  @[@"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr0nly5j20pf0gygo6.jpg", @"http://ww4.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr1d0vyj20pf0gytcj.jpg", @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr1xydcj20gy0o9q6s.jpg", @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",@"http://ww4.sinaimg.cn/thumbnail/7f8c1087gw1e9g06pc68ug20ag05y4qq.gif"];
    model.text = self.textArray[indexPath.row % 4];
    //NSLog(@"%@",cell.subviews);
    //cell.separatorInset = UIEdgeInsetsMake(10, 0, 0, 0);
    //tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    cell.photoModel = model;
    tableView.separatorColor = [UIColor clearColor];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (void)tableView: (UITableView*)tableView willDisplayCell: (UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath
{
    cell.backgroundColor = [UIColor lightGrayColor];
}

@end
