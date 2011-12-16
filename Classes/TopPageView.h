//----------------------------------------------------------------------------//
//  TopPageView.h
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//

#import <UIKit/UIKit.h>
#import "SlideView.h"
#import <MediaPlayer/MediaPlayer.h>
#import "MyMoviePlayerViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface TopPageView : SlideView <UIScrollViewDelegate> {
	UIScrollView *scrollView;
	UIPageControl *pageControl;
	MyMoviePlayerViewController *playerViewController;
}

@end
