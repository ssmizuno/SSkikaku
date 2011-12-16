//
//  SixthPageView.m
//  sskikaku
//
//  Created by 水野 真史 on 11/03/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SixthPageView.h"
#import "MapKit/MapKit.h"
#import "MapAnnotation.h"
#import "ScrollViewController.h"

@implementation SixthPageView

@synthesize AbookNavigationController;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		//背景フレームの作成
		UIImage *backGroundImage = [UIImage imageNamed:@"Base06.png"];
		UIImageView *backGroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, backGroundImage.size.width, backGroundImage.size.height)];
		backGroundView.image = backGroundImage;
		[self addSubview:backGroundView];
		[backGroundView release];
        
        //概要テキスト01
		UITextView *textView01 = [[UITextView alloc] initWithFrame:CGRectMake(55, 90, 326, 360)];
		NSString *textPath01 = [[NSBundle mainBundle] pathForResource:@"PublishText07" ofType:@"txt"];
		NSString *text01 = [NSString stringWithContentsOfFile:textPath01 encoding:NSUTF8StringEncoding error:nil];
		textView01.text = text01;
		textView01.font = [UIFont systemFontOfSize:14];
		textView01.editable = NO;
		textView01.backgroundColor = [UIColor clearColor];
		[self addSubview:textView01];
		[textView01 release];
		
        //ラベル
		UILabel *videoLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 485, 120, 25)];
		videoLabel.text = @"▼view";
		videoLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:16.0];
		videoLabel.backgroundColor = [UIColor clearColor];
		[self addSubview:videoLabel];
		[videoLabel release];
		
        
        //Abookプレビューを開始するボタン
        UIImage *abookImage = [UIImage imageNamed:@"Abookplay.png"];
        UIButton *abookButton = [[UIButton alloc] initWithFrame:CGRectMake(55, 510, 658, 439)];
        [abookButton setBackgroundImage:abookImage forState:UIControlStateNormal];
        [abookButton addTarget:self action:@selector(AbookButtonPressed) forControlEvents:UIControlEventTouchDown];
        [self addSubview:abookButton];
        [abookButton release];
        
        
		//サンプルページをスクロールビューで閲覧できるコントローラ
		ScrollViewController *scrollViewController = [[ScrollViewController alloc] initWithImageNumber:1];
		//ナビゲーションコントローラにセット
		AbookNavigationController = [[UINavigationController alloc] initWithRootViewController:scrollViewController];
		AbookNavigationController.view.frame = CGRectMake(0, -20, 768, 1024);
		AbookNavigationController.navigationBarHidden = YES;
		AbookNavigationController.toolbarHidden = NO;
		[scrollViewController release];
        
        
    }
    return self;
}
/*
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotaion:(id <MKAnnotation>)annotation {
	MKPinAnnotationView *pinAnnotationView = 
	[[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"TokyoTower"] autorelease];
	pinAnnotationView.pinColor = MKPinAnnotationColorRed;
	pinAnnotationView.animatesDrop = YES;
	
	return pinAnnotationView;
}
*/
//スクロールビューのページが変わったら呼ばれるメソッド
- (void)pageChanged {
	CGRect pageFrame = scrollView.frame;
	pageFrame.origin.x = pageFrame.size.width * pageControl.currentPage;
	
	[scrollView scrollRectToVisible:pageFrame animated:YES];
}

//スクロールが終わったら呼ばれるメソッド
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    CGFloat pageWidth = scrollView.frame.size.width;
    pageControl.currentPage = 1 + floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth);
}

//safariでリンクを開くメソッド
- (void)myspaceAction {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://jp.myspace.com/"]];
}

- (void)mixiAction {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://mixi.jp/"]];
}

//動画再生を開始するメソッド
- (void)moviePlay {
	playerViewController = [[MyMoviePlayerViewController alloc] initWithContentURL:
							[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"florida" ofType:@"m4v"]]];
	playerViewController.view.frame = CGRectMake(0, -20, 768, 1024);
	MPMoviePlayerController *movieController = [playerViewController moviePlayer];
	movieController.controlStyle = MPMovieControlStyleFullscreen;
	movieController.scalingMode = MPMovieScalingModeAspectFit;
	movieController.shouldAutoplay = YES;
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(moviePlayBackDidFinish:) 
												 name:MPMoviePlayerPlaybackDidFinishNotification 
											   object:nil];
	
	playerViewController.view.alpha = 0.0;
	[self addSubview:playerViewController.view];
	
	//ビューのフェードイン用アニメーション
	[UIView beginAnimations:@"MovieAppear" context:NULL];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	playerViewController.view.alpha = 1.0;
	[UIView commitAnimations];
	
}

//動画の終了を検知して呼ばれるメソッド
-(void)moviePlayBackDidFinish:(NSNotification*)notification {
	[[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:nil];
	//フェードアウト用アニメーション
	[UIView beginAnimations:@"MovieDisappear" context:NULL];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(disappearAnimationDidStop)];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	playerViewController.view.alpha = 0.0;
	[UIView commitAnimations];	
}

//Bookボタンをタップすると呼ばれるメソッド
- (void)AbookButtonPressed {
	AbookNavigationController.view.alpha = 0.0;
	//ナビゲーションコントローラのビューを追加
	[self addSubview:AbookNavigationController.view];
    
	//フェードインアニメーション
	[UIView beginAnimations:@"Appear" context:NULL];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	AbookNavigationController.view.alpha = 1.0;
	[UIView commitAnimations];
}

- (void)disappearAnimationDidStop {
	[playerViewController.view removeFromSuperview];
	
}

- (void)dealloc {
	[scrollView release];
	[pageControl release];
	[playerViewController release];    
	[AbookNavigationController release];
    [super dealloc];
}


@end