//
//  PhotoFrameModel.h
//  PNotes
//
//  Created by lyn on 14-12-10.
//  Copyright (c) 2014年 lyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoModel.h"
#import <CoreGraphics/CoreGraphics.h>

@interface PhotoFrameModel : NSObject
@property (nonatomic,strong) PhotoModel *photoModel;
@property (nonatomic,assign,readonly) CGRect timeFrame;
@property (nonatomic,assign,readonly) CGRect textFrame;

@end
