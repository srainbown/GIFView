//
//  DiscoverViewController.m
//  GIFView
//
//  Created by 紫川秀 on 2017/12/6.
//  Copyright © 2017年 dangbei. All rights reserved.
//

#import "DiscoverViewController.h"
#import <SDWebImage/UIImage+GIF.h>


@interface DiscoverViewController ()

@property (nonatomic, strong) UIImageView *gif_one;

@property (nonatomic, strong) UIImageView *gif_two;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         backgroundColor = [UIColor whiteColor];
//    NSString *urlStr = @"http://upload-images.jianshu.io/upload_images/1603768-4d821957f044a28c.gif?imageMogr2/auto-orient/strip";
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]];
    
    _gif_one = [[UIImageView alloc]init];
    [self.view addSubview:_gif_one];
    [_gif_one mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.top).offset(KNaviHeight);
        make.left.right.mas_equalTo(self.view).offset(0);
        make.height.mas_equalTo(@100);
    }];
    _gif_one.backgroundColor = [UIColor redColor];
//    _gif_one.image = [self getGitImageWithData:data];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
