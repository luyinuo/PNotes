//
//  PhotoCell.h
//  PNotes
//
//  Created by lyn on 14-12-11.
//  Copyright (c) 2014年 lyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoFrameModel.h"
#import "PhotoStackView.h"
@interface PhotoCell : UITableViewCell <PhotoStackViewDataSource, PhotoStackViewDelegate>
@property (nonatomic,strong) PhotoFrameModel *photoFrame;
@property (nonatomic,strong) PhotoModel *photoModel;
@end
