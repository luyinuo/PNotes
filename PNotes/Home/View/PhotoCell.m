//
//  PhotoCell.m
//  PNotes
//
//  Created by lyn on 14-12-11.
//  Copyright (c) 2014年 lyn. All rights reserved.
//

#import "PhotoCell.h"
#import "UIImageView+MJWebCache.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#define RGB(a,b,c) [UIColor colorWithRed:a/255 green:b/255 blue:c/255 alpha:1.0]
@interface PhotoCell()
{
    NSArray *_urls;
}
@property (nonatomic,strong) PhotoStackView *photoStack;
@property (nonatomic, strong) NSMutableArray *photos;
@property (nonatomic,weak) UIImageView *timeLineUp;
@property (nonatomic,weak) UIImageView *timeLineDown;
@property (nonatomic,weak) UIImageView *timePoint;
@property (nonatomic,weak) UIImageView *contentBg;
@property (nonatomic,weak) UILabel *contentLabel;
@property (nonatomic,weak) UILabel *timeLabel;
@end

@implementation PhotoCell

//-(NSArray *)photos {
//    if(!_photos) {
//        
//        _photos = [NSMutableArray array];
//        for (int i = 0; i<_urls.count; i++) {
//            // 替换为中等尺寸图片
//            NSString *url = [_urls[i] stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
//            //异步下载图片
//            
//            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
//            UIImage *photo = [UIImage imageWithData:data];
//            
//            [_photos addObject:photo];
//            
//        }
//
////        _photos = [NSArray arrayWithObjects:
////                   [UIImage imageNamed:@"photo1.jpg"],
////                   [UIImage imageNamed:@"photo2.jpg"],
////                   [UIImage imageNamed:@"photo3.jpg"],
////                   [UIImage imageNamed:@"photo4.jpg"],
////                   [UIImage imageNamed:@"photo5.jpg"],
////                   nil];
//        
//    }
//    return _photos;
//}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _urls = @[@"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr0nly5j20pf0gygo6.jpg", @"http://ww4.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr1d0vyj20pf0gytcj.jpg", @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr1xydcj20gy0o9q6s.jpg", @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",@"http://ww4.sinaimg.cn/thumbnail/7f8c1087gw1e9g06pc68ug20ag05y4qq.gif"];
        //相册集
        PhotoStackView *photoStack = [[PhotoStackView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
        self.photoStack = photoStack;
        self.photoStack.urls = _urls;
        self.photoStack.dataSource = self;
        self.photoStack.delegate = self;
        [self.contentView addSubview:self.photoStack];
        //时间轴线
        UIImageView *timeLineUp = [[UIImageView alloc] init];
        timeLineUp.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"time_mark.jpg"]];
        self.timeLineUp = timeLineUp;
        [self.contentView addSubview:timeLineUp];
        
        UIImageView *timeLineDown = [[UIImageView alloc] init];
        timeLineDown.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"time_mark.jpg"]];
        self.timeLineDown = timeLineDown;
        [self.contentView addSubview:timeLineDown];
        
        //时间轴点
        UIImageView *timePoint = [[UIImageView alloc] init];
        timePoint.image = [UIImage imageNamed:@"time_mark_point"];
        self.timePoint = timePoint;
        [self.contentView addSubview:timePoint];
        
        //时间
        UILabel *timeLabel = [[UILabel alloc] init];
        self.timeLabel = timeLabel;
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.textColor = RGB(242, 132, 151);
        timeLabel.text = @"14-12-11 09:35:42";
        [self.contentView addSubview:timeLabel];
        //文字背景
        UIImageView *contentBackGroundImageView = [[UIImageView alloc] init];
        contentBackGroundImageView.image = [[UIImage imageNamed:@"content_bg"]stretchableImageWithLeftCapWidth:5 topCapHeight:50];
        self.contentBg = contentBackGroundImageView;
        [self.contentView addSubview:contentBackGroundImageView];
        
        //文字内容
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.numberOfLines = 0;
        self.contentLabel = contentLabel;
        self.contentLabel.textColor = [UIColor blackColor];
        self.contentLabel.font = [UIFont systemFontOfSize:14];
        self.contentLabel.text = @"哈哈哈";
        self.contentLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:contentLabel];
        
        //self.imgView.backgroundColor = [UIColor redColor];
        
        self.selectedBackgroundView = [[UIView alloc] init];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
   // [super setSelected:selected animated:animated];


}
- (void) layoutSubviews
{
//    self.imgView.frame = CGRectMake(10, 40, 200, 200);
    self.timeLineUp.frame = CGRectMake(8, 0, 2, 15);
    self.timePoint.frame = CGRectMake(3, 18, 13, 13);
    self.timeLabel.frame = CGRectMake(21, 16, 150, 20);
    self.timeLineDown.frame = CGRectMake(8, 34, 2, self.contentView.frame.size.height - 34);
    CGFloat contentLabelX = self.contentView.center.x;
    CGFloat contentLabelY = self.contentView.center.y-50;
    CGFloat contentLabelMaxW = self.contentView.frame.size.width / 2 - 10;
    CGSize contentLabelSize = [self.contentLabel.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(contentLabelMaxW, MAXFLOAT)];
    self.contentLabel.frame = (CGRect){{contentLabelX+5,contentLabelY+5},contentLabelSize};
    self.contentBg.frame = (CGRect){{contentLabelX,contentLabelY},{contentLabelSize.width + 10,contentLabelSize.height+10}};

    _photoStack.center = CGPointMake(self.contentView.center.x-75, self.contentView.center.y+20);
    

}


- (void) setPhotoFrame:(PhotoFrameModel *)photoFrame
{
    
}

-(void) setPhotoModel:(PhotoModel *)photoModel
{
    //_urls = photoModel.pic_urls;
    self.contentLabel.text = photoModel.text;
    self.photoStack.urls = photoModel.pic_urls;
    
}

#pragma mark -
#pragma mark Deck DataSource Protocol Methods

-(NSUInteger)numberOfPhotosInPhotoStackView:(PhotoStackView *)photoStack {
    return [_urls count];
}

-(NSString *)photoStackView:(PhotoStackView *)photoStack photoForIndex:(NSUInteger)index {
//    return [_urls objectAtIndex:index];
    NSString *url = [_urls[index] stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
    return url;
}
- (CGSize)photoStackView:(PhotoStackView *)photoStack photoSizeForIndex:(NSUInteger)index
{
    UIImage *image = self.photos[index];
    if (image.size.width>image.size.height) {
        return CGSizeMake(125, 94);
    }else{
        return CGSizeMake(94, 125);
    }
}


#pragma mark -
#pragma mark Deck Delegate Protocol Methods

-(void)photoStackView:(PhotoStackView *)photoStackView willStartMovingPhotoAtIndex:(NSUInteger)index {
    // User started moving a photo
    NSLog(@"move index --%d",index);
}

-(void)photoStackView:(PhotoStackView *)photoStackView willFlickAwayPhotoAtIndex:(NSUInteger)index {
    // User flicked the photo away, revealing the next one in the stack
}

-(void)photoStackView:(PhotoStackView *)photoStackView didRevealPhotoAtIndex:(NSUInteger)index {
//    self.pageControl.currentPage = index;
}

-(void)photoStackView:(PhotoStackView *)photoStackView didSelectPhotoAtIndex:(NSUInteger)index {
    NSLog(@"selected %d", index);
}

@end
