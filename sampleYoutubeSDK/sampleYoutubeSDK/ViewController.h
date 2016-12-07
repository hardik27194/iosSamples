//
//  ViewController.h
//  sampleYoutubeSDK
//
//  Created by takeshi shimada on 2016/03/29.
//  Copyright © 2016年 takeshi shimada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"

@interface ViewController : UIViewController <YTPlayerViewDelegate>

@property(nonatomic, strong) YTPlayerView *playerView;

@end

