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

@interface PhotoCell()
{
    NSArray *_urls;
}
@property (nonatomic,weak) PhotoStackView *photoStack;
@property (nonatomic, strong) NSMutableArray *photos;
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
        _urls = @[  @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr0nly5j20pf0gygo6.jpg", @"http://ww4.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr1d0vyj20pf0gytcj.jpg", @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr1xydcj20gy0o9q6s.jpg", @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",@"http://ww4.sinaimg.cn/thumbnail/7f8c1087gw1e9g06pc68ug20ag05y4qq.gif"];
        PhotoStackView *photoStack = [[PhotoStackView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
        self.photoStack = photoStack;
        self.photoStack.urls = _urls;
       
        _photoStack.dataSource = self;
        _photoStack.delegate = self;
        //self.imgView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.photoStack];
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
     _photoStack.center = CGPointMake(self.contentView.center.x-75, self.contentView.center.y);

}


- (void) setPhotoFrame:(PhotoFrameModel *)photoFrame
{
    
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
