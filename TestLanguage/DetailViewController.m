//
//  DetailViewController.m
//  TestLanguage
//
//  Created by syt on 2019/12/13.
//  Copyright © 2019 syt. All rights reserved.
//

#import "DetailViewController.h"
#import "BWLanguageUtil.h"

#define kLocalizedString(x)    NSLocalizedString(x, nil)

@interface DetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    UITableView *tabView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tabView.delegate = self;
    tabView.dataSource = self;
    tabView.tableFooterView = [UIView new];
    [self.view addSubview:tabView];
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.dataArray[indexPath.row]];
    NSInteger index = [[[NSUserDefaults standardUserDefaults] valueForKey:@"selectIndex"] integerValue];
    if (index == indexPath.row) {
        NSLog(@"index = %zd", index);
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"row = %zd", indexPath.row);
    [[NSUserDefaults standardUserDefaults] setValue:@(indexPath.row) forKey:@"selectIndex"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if (indexPath.row == 0) {
        [BWLanguageUtil setUserLanguage:@"zh-Hans"];
    } else if (indexPath.row == 1) {
        [BWLanguageUtil setUserLanguage:@"zh-Hant"];
    } else if (indexPath.row == 2) {
        [BWLanguageUtil setUserLanguage:@"en"];
    } else if (indexPath.row == 3) {
        [BWLanguageUtil setUserLanguage:@""];
    }

    // 重设语言通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"language" object:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}









#pragma mark - lazy loading

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@"简体中文", @"繁體中文", @"English", kLocalizedString(@"FollowSystemLanguage")];
    }
    return _dataArray;
}
















@end
