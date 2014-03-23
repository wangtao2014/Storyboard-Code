//
//  WTCPlayerDetailsViewController.m
//  Storyboard
//
//  Created by wangtao on 14-1-9.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "WTCPlayerDetailsViewController.h"
#import "WTCGamePickerViewController.h"
#import "WTCPlayer.h"

@interface WTCPlayerDetailsViewController ()
{
    NSString *_game;
}

@property (strong, nonatomic) UILabel *ibDetailLabel;
@property (strong, nonatomic) UITextField *ibPlayerNameTextField;
- (void)ibCancelAction:(id)sender;
- (void)ibAddAction:(id)sender;

@end

@implementation WTCPlayerDetailsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        NSLog(@"2, init");
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    NSLog(@"2. loadview");
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"2, viewdidload");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"Add Player";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(ibCancelAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(ibAddAction:)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"2,viewWillAppear,MovingToParent=%d", self.isMovingToParentViewController);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"2,viewDidAppear,MovingToParent=%d", self.isMovingToParentViewController);
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"2,viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"2,viewDidLayoutSubviews");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"2,viewWillDisappear,MovingFromParent=%d", self.isMovingFromParentViewController);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"2,viewDidDisappear,MovingFromParent=%d", self.isMovingFromParentViewController);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.ibPlayerNameTextField becomeFirstResponder];
    } else if (indexPath.section == 1){
        WTCGamePickerViewController *gamePickerViewController = [[WTCGamePickerViewController alloc] init];
        gamePickerViewController.delegate = self;
        [self.navigationController pushViewController:gamePickerViewController animated:YES];
    }
}

#pragma mark TableView Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    
    if (section == 0) {
        sectionName = @"Player Name";
    } else {
        sectionName = @"Select Game";
    }
    return sectionName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *nameCellIdentity = @"NameCell";
    static NSString *gameCellIdentity = @"GameCell";
    UITableViewCell *cell;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:nameCellIdentity];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nameCellIdentity];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            CGRect rect = CGRectMake(10, 0, CGRectGetWidth(cell.frame) - 20, CGRectGetHeight(cell.frame));
            _ibPlayerNameTextField = [[UITextField alloc] initWithFrame:rect];
            [cell addSubview:_ibPlayerNameTextField];
        }
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:gameCellIdentity];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:gameCellIdentity];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            UILabel *gameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 6.5f, 46, 30)];
            gameLabel.text = @"Game";
            [cell addSubview:gameLabel];
            
            _ibDetailLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 6.5f, 185, 30)];
            _ibDetailLabel.textAlignment = NSTextAlignmentRight;
            [cell addSubview:_ibDetailLabel];
        }
    }
    return cell;
}

- (void)ibCancelAction:(id)sender {
    [self.delegate playerDetailViewControllerDidCancel:self];
}

- (void)ibAddAction:(id)sender {
    WTCPlayer *player = [[WTCPlayer alloc] init];
    player.name = self.ibPlayerNameTextField.text;
    player.game = _game;
    player.rating = 3;
    [self.delegate playerDetailViewController:self didAddPlayer:player];
}

#pragma mark WTCGamePickerViewControllerDelegate
- (void)gamePickerViewController:(WTCGamePickerViewController *)controller didSelectedGame:(NSString *)game
{
    _game = game;
    self.ibDetailLabel.text = game;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
