//
//  WTCPlayersViewController.h
//  Storyboard
//
//  Created by wangtao on 14-1-8.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCPlayerDetailsViewController.h"

@interface WTCPlayersViewController : UITableViewController<PlayerDetailsViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *players;

@end
