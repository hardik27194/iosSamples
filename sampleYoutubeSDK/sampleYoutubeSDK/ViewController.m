//
//  ViewController.m
//  sampleYoutubeSDK
//
//  Created by takeshi shimada on 2016/03/29.
//  Copyright © 2016年 takeshi shimada. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.playerView = [[YTPlayerView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    self.playerView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
    self.playerView.delegate = self;
    [self.view addSubview:self.playerView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated {

//    [self.playerView loadWithVideoId:@"M7lc1UVf-VE"];
    
    NSDictionary *playerVars = @{@"playsinline" : @1,};
    [self.playerView loadWithVideoId:@"i7P4hjusxB0" playerVars:playerVars];
    
    [self.playerView playVideo];
}


# pragma mark -- youtube sdk 
- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state {
    switch (state) {
        case kYTPlayerStatePlaying:
            NSLog(@"Started playback");
            break;
        case kYTPlayerStatePaused:
            NSLog(@"Paused playback");
            break;
        default:
            break;
    }
}


@end
