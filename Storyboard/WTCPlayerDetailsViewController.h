//
//  WTCPlayerDetailsViewController.h
//  Storyboard
//
//  Created by wangtao on 14-1-9.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCGamePickerViewController.h"

@class WTCPlayerDetailsViewController;
@class WTCPlayer;

@protocol PlayerDetailsViewControllerDelegate <NSObject>

- (void)playerDetailViewControllerDidCancel:(WTCPlayerDetailsViewController *)controller;
- (void)playerDetailViewController:(WTCPlayerDetailsViewController *)controller didAddPlayer:(WTCPlayer *)player;

@end

@interface WTCPlayerDetailsViewController : UITableViewController<WTCGamePickerViewControllerDelegate>

@property (nonatomic, weak) id<PlayerDetailsViewControllerDelegate> delegate;

@end
