//
//  GIFView.h
//  GIFView
//
//  Created by 紫川秀 on 2017/12/5.
//  Copyright © 2017年 dangbei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>

@interface GIFView : UIView

-(id)initWithFrame:(CGRect)frame filePath:(NSString *)filePath andInterval:(float)time;
-(id)initWithFrame:(CGRect)frame data:(NSData *)data andInterval:(float)time;

@end
