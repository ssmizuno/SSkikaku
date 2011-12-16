//----------------------------------------------------------------------------//
//  ScrollViewController.h
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//


#import <UIKit/UIKit.h>

@interface ScrollViewController : UIViewController <UIScrollViewDelegate>{
	UIImageView *imageView;
	int pageNumber;
	UIScrollView *imageScrollView;
	float initialScale;
}
- (id)initWithImageNumber:(int)page;

@end