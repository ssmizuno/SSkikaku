//
//  FifthPageView.h
//  sskikaku
//
//  Created by 水野 真史 on 11/03/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideView.h"
#import <MediaPlayer/MediaPlayer.h>
#import "MyMoviePlayerViewController.h"


@interface FifthPageView : SlideView <UIScrollViewDelegate> {
	UIScrollView *scrollView;
	UIPageControl *pageControl;
	MyMoviePlayerViewController *playerViewController;
}

@end