//
//  WTCPlayersViewController.m
//  Storyboard
//
//  Created by wangtao on 14-1-8.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "WTCPlayersViewController.h"
#import "WTCPlayer.h"
#import "WTCPlayerDetailsViewController.h"
#import "WTCParams.h"

@interface WTCPlayersViewController ()

- (UIImage *)imageForRating:(int)rating;

@end

@implementation WTCPlayersViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        NSLog(@"1,init");
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    NSLog(@"1, loadview");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"1,viewdidload");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.title = @"Players";
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(handleAddPlayer:)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    // 设置分割线间距
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    // 设置是否可以拖动
    self.tableView.scrollEnabled = NO;
    // 去掉多余分割线 显示最后一行的下面分割线
    UIView *footView = [[UIView alloc] init];
    footView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = footView;
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", nil];
    NSLog(@"A,%@", array);
    
    __block NSArray *blockArray = array;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"B, %@", blockArray);
    });
    NSLog(@"C,%@", array);
    
//    SEL sele = @selector(test:second:);
    [self performSelector:@selector(test:second:) withObject:@"hehlo" withObject:@"fffff"];
}

- (void)test:(NSString *)first second:(NSString *)second
{
    NSLog(@"first=%@, second=%@", first, second);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"1,viewWillAppear,MovingToParent=%d", self.isMovingToParentViewController);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"1,viewDidAppear,MovingToParent=%d", self.isMovingToParentViewController);
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"1,viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"1,viewDidLayoutSubviews");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"1,viewWillDisappear,MovingFromParent=%d", self.isMovingFromParentViewController);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"1,viewDidDisappear,MovingFromParent=%d", self.isMovingFromParentViewController);
}

- (void)handleAddPlayer:(id)sender
{
    WTCPlayerDetailsViewController *detailViewController = [[WTCPlayerDetailsViewController alloc] initWithStyle:UITableViewStyleGrouped];
    detailViewController.delegate = self;
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailViewController animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_players count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    // 去掉多余分割线 最后一行的下面分割线不显示
//    UIView *footView = [[UIView alloc] init];
//    footView.backgroundColor = [UIColor clearColor];
//    return footView;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"PlayerCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UIView *accessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, cell.frame.size.height)];
        accessoryView.backgroundColor = [UIColor redColor];
        cell.editingAccessoryView = accessoryView;
        cell.editingAccessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        WTCPlayer *player = (WTCPlayer *)[_players objectAtIndex:indexPath.row];
        // subtitle model
        cell.textLabel.text = player.name;
        cell.detailTextLabel.text = player.game;
        // 左边图像
        cell.imageView.image = [UIImage imageNamed:@"1Star"];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(203, 15, 81, 30)];
        imageView.contentMode = UIViewContentModeCenter;
        imageView.image = [self imageForRating:player.rating];
        [cell addSubview:imageView];
    }
    return cell;
}

- (UIImage *)imageForRating:(int)rating
{
    switch (rating) {
        case 1: return [UIImage imageNamed:@"1StarSmall"];
        case 2: return [UIImage imageNamed:@"2StarsSmall"];
        case 3: return [UIImage imageNamed:@"3StarsSmall"];
        case 4: return [UIImage imageNamed:@"4StarsSmall"];
        case 5: return [UIImage imageNamed:@"5StarsSmall"];
    }
    return nil;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.players removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark PlayerDetailsViewControllerDelegate

- (void)playerDetailViewControllerDidCancel:(WTCPlayerDetailsViewController *)controller
{
    [controller.navigationController popViewControllerAnimated:YES];
}

- (void)playerDetailViewController:(WTCPlayerDetailsViewController *)controller didAddPlayer:(WTCPlayer *)player
{
    [_players addObject:player];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.players count] - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [controller.navigationController popViewControllerAnimated:YES];
}

@end
