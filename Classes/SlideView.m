//----------------------------------------------------------------------------//
//  SlideView.m
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//

#import "SlideView.h"

@implementation SlideView
@synthesize slideDelegate;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		self.userInteractionEnabled = YES;
		self.scrollEnabled = NO;
		self.contentSize = CGSizeMake(frame.size.width, frame.size.height);
    }
    return self;
}

//スワイプモーションを検知するメソッド群
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
	startTouchPosition = [touch locationInView:self];
	
	//画面の端のタップを検知してページ送り
	if(startTouchPosition.x < 50) {
		[slideDelegate popCurrentViewController];
	}else if(startTouchPosition.x > 718) {
		[slideDelegate pushNextViewController];
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self];
	
	//画面の下部でのスワイプのみを検知する
	if(startTouchPosition.y > 950){		
		if (fabsf(startTouchPosition.x - currentTouchPosition.x) >= 30 &&
			fabsf(startTouchPosition.y - currentTouchPosition.y) <= 10)
			
		{
			if (startTouchPosition.x < currentTouchPosition.x){
				[slideDelegate popCurrentViewController];
				
			}else {
				[slideDelegate pushNextViewController];
				
			}
		}
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    startTouchPosition = CGPointZero;
	
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    startTouchPosition = CGPointZero;
}	

- (void)dealloc {
    [super dealloc];
}

@end