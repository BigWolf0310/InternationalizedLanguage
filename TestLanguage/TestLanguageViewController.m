//
//  TestLanguageViewController.m
//  TestLanguage
//
//  Created by syt on 2019/12/13.
//  Copyright © 2019 syt. All rights reserved.
//

#import "TestLanguageViewController.h"
#import "DetailViewController.h"

#define kLocalizedString(x)    NSLocalizedString(x, nil)

@interface TestLanguageViewController ()

@end

@implementation TestLanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 30);
    [button setTitle:kLocalizedString(@"button") forState:UIControlStateNormal];
    [button setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
 
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(button.frame) + 30, [UIScreen mainScreen].bounds.size.width, 30)];
    label.text = kLocalizedString(@"label");
    label.textColor = UIColor.blackColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
    
    UILabel *internetLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame) + 30, [UIScreen mainScreen].bounds.size.width, 30)];
    internetLabel.text = kLocalizedString(@"Internet");
    internetLabel.textColor = UIColor.blackColor;
    internetLabel.textAlignment = NSTextAlignmentCenter;
    internetLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:internetLabel];
    
}

- (void)jump
{
    [self.navigationController pushViewController:[DetailViewController new] animated:YES];
}











@end
