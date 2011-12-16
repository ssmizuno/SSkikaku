//----------------------------------------------------------------------------//
//  IndexPageView.h
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

@interface IndexPageView : SlideView <UIPopoverControllerDelegate, UIScrollViewDelegate, UIWebViewDelegate > {
	UIImageView *liveReportOneImageView;
	UIPopoverController *popoverController;
	UIScrollView *scrollView;
	UIPageControl *pageControl;
}
@end