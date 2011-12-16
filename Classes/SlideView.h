//----------------------------------------------------------------------------//
//  SlideView.h
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//

#import <UIKit/UIKit.h>

//SlideViewDelegateの宣言
@protocol SlideViewDelegate
//次のページへ遷移
- (void)pushNextViewController;
//前のページへ遷移
- (void)popCurrentViewController;
//指定のページへ遷移
- (void)jumpToViewController:(int)page;
@end

//UIScrollViewのサブクラスとして実装
@interface SlideView : UIScrollView {
	NSObject<SlideViewDelegate> *slideDelegate;
	CGPoint startTouchPosition;	
}
@property(nonatomic, assign) 	NSObject<SlideViewDelegate> *slideDelegate;

@end
