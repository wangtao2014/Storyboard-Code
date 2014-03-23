//
//  WTCGamePickerViewController.h
//  Storyboard
//
//  Created by wangtao on 14-1-9.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WTCGamePickerViewController;

@protocol WTCGamePickerViewControllerDelegate <NSObject>

- (void)gamePickerViewController:(WTCGamePickerViewController *)controller didSelectedGame:(NSString *)game;

@end

@interface WTCGamePickerViewController : UITableViewController

@property (nonatomic, weak) id<WTCGamePickerViewControllerDelegate> delegate;
@property (nonatomic, copy) NSString *game;

@end
