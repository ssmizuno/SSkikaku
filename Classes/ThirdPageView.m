//----------------------------------------------------------------------------//
//  ThirdPageView.m
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//

#import "ThirdPageView.h"
#import "MapKit/MapKit.h"
#import "MapAnnotation.h"

@implementation ThirdPageView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		//背景フレームの作成
		UIImage *backGroundImage = [UIImage imageNamed:@"Base03.png"];
		UIImageView *backGroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, backGroundImage.size.width, backGroundImage.size.height)];
		backGroundView.image = backGroundImage;
		[self addSubview:backGroundView];
		[backGroundView release];
        
        //概要テキスト01
		UITextView *textView01 = [[UITextView alloc] initWithFrame:CGRectMake(55, 90, 326, 360)];
		NSString *textPath01 = [[NSBundle mainBundle] pathForResource:@"PublishText04" ofType:@"txt"];
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
		
        
         //動画再生を開始するボタン
         UIImage *movieImage = [UIImage imageNamed:@"Video_play.png"];
         UIButton *movieButton = [[UIButton alloc] initWithFrame:CGRectMake(55, 510, 658, 439)];
         [movieButton setBackgroundImage:movieImage forState:UIControlStateNormal];
         [movieButton addTarget:self action:@selector(moviePlay) forControlEvents:UIControlEventTouchDown];
         [self addSubview:movieButton];
         [movieButton release];
         
        
        		
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
    NSBundle* bundle=[NSBundle mainBundle];
    NSString* path=[bundle pathForResource:@"florida" ofType:@"m4v"];
    NSURL* url=[NSURL fileURLWithPath:path];
	
    MPMoviePlayerController  *movie=[[MPMoviePlayerController alloc] initWithContentURL:url];
    movie.scalingMode=MPMovieScalingModeAspectFit;
	
	
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:movie];
	
    [movie prepareToPlay];
    
    [movie play];
    
	
    [movie.view setFrame:CGRectMake(55, 510, 658, 439)]; 
    movie.view.backgroundColor = [UIColor clearColor];  
    
    /*
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
    */
	
	//ビューのフェードイン用アニメーション
	[UIView beginAnimations:@"MovieAppear" context:NULL];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	playerViewController.view.alpha = 1.0;
	[UIView commitAnimations];
    
    [self addSubview:movie.view];   

	
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

- (void)disappearAnimationDidStop {
	[playerViewController.view removeFromSuperview];
	
}

- (void)dealloc {
	[scrollView release];
	[pageControl release];
	[playerViewController release];
    [super dealloc];
}


@end