//
//  WTCSecondViewController.m
//  Storyboard
//
//  Created by wangtao on 14-1-23.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "WTCSecondViewController.h"

@interface WTCSecondViewController ()

@end

@implementation WTCSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100.0f, 100.0f, 100.0f, 100.0f)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
