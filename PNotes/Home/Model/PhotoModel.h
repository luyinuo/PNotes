//
//  PhotoModel.h
//  PNotes
//
//  Created by lyn on 14-12-10.
//  Copyright (c) 2014年 lyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoModel : NSObject
@property (nonatomic,strong) NSArray* pic_urls;
@property (nonatomic,copy) NSString* text;
@property (nonatomic,copy) NSString* time;
@end
