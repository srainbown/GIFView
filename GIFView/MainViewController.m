//
//  MainViewController.m
//  GIFView
//
//  Created by 紫川秀 on 2017/12/5.
//  Copyright © 2017年 dangbei. All rights reserved.
//

#define KWidth self.view.bounds.size.width
#define KHeight self.view.bounds.size.height

#import "MainViewController.h"
#import "GIFView.h"

@interface MainViewController ()

@property (nonatomic, strong) GIFView *gifView_one;
@property (nonatomic, strong) GIFView *gifView_two;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *filePath_one = [[NSBundle mainBundle] pathForResource:@"IMG_1035" ofType:@"gif"];
    _gifView_one = [[GIFView alloc]initWithFrame:CGRectMake(0, 64, KWidth, 200) filePath:filePath_one andInterval:0.05];
    [self.view addSubview:_gifView_one];
    
    NSString *filePath_two = [[NSBundle mainBundle] pathForResource:@"IMG_1036" ofType:@"gif"];
    _gifView_two = [[GIFView alloc]initWithFrame:CGRectMake(0, 300, KWidth, 200) filePath:filePath_two andInterval:0.2];
    [self.view addSubview:_gifView_two];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
