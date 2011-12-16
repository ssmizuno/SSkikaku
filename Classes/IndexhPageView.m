//----------------------------------------------------------------------------//
//  IndexPageView.m
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//

#import "IndexPageView.h"
#import "MapKit/MapKit.h"
#import "MapAnnotation.h"
#import "PopoverViewController.h"

@implementation IndexPageView
- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        //背景フレームの作成
		UIImage *backGroundImage = [UIImage imageNamed:@"index.png"];
		UIImageView *backGroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, backGroundImage.size.width, backGroundImage.size.height)];
		backGroundView.image = backGroundImage;
		[self addSubview:backGroundView];
		[backGroundView release];
		
		//コーヒーの広告ボタンを作成
		UIImage *coffeeImage = [UIImage imageNamed:@"web.gif"];
		UIButton *coffeeImageButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, 150, 60)];
		[coffeeImageButton setBackgroundImage:coffeeImage forState:UIControlStateNormal];
		[coffeeImageButton addTarget:self action:@selector(coffeeAction) forControlEvents:UIControlEventTouchDown];
		[self addSubview:coffeeImageButton];
		[coffeeImageButton release];
		
		//広告ページ用のUIWebViewインスタンスの作成
		UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(5, 5, 600, 400)];
		[webView loadRequest:[NSURLRequest requestWithURL:
							  [NSURL URLWithString:@"http://www.ss-multi.co.jp/index.html"]]];
		webView.delegate = self;
		webView.scalesPageToFit = YES;
		
		//広告ページをポップアップするようにビューコントローラを作成
		PopoverViewController *popoverViewController = [[PopoverViewController alloc] initWithPopView:webView];    		
		popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverViewController];
		popoverController.delegate = self;
		[popoverViewController release];
		[webView release];
        
        //見出し
		NSString *TitleTextPath = [[NSBundle mainBundle] pathForResource:@"001Title" ofType:@"txt"];
		NSString *TitleText = [NSString stringWithContentsOfFile:TitleTextPath encoding:NSUTF8StringEncoding error:nil];
		UITextView *TitleTextView = [[UITextView alloc] initWithFrame:CGRectMake(310, 25, 500, 200)];
		TitleTextView.text = TitleText;
		TitleTextView.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:24.0];
		TitleTextView.editable = NO;
		TitleTextView.scrollEnabled = NO;
		TitleTextView.dataDetectorTypes = UIDataDetectorTypeLink;
		TitleTextView.backgroundColor = [UIColor clearColor];
		[self addSubview:TitleTextView];
		[TitleTextView release];
        
        //概要テキスト01
		UITextView *textView01 = [[UITextView alloc] initWithFrame:CGRectMake(34, 130, 700, 180)];
		NSString *textPath01 = [[NSBundle mainBundle] pathForResource:@"PublishText01" ofType:@"txt"];
		NSString *text01 = [NSString stringWithContentsOfFile:textPath01 encoding:NSUTF8StringEncoding error:nil];
		textView01.text = text01;
		textView01.font = [UIFont systemFontOfSize:14];
		textView01.editable = NO;
		textView01.backgroundColor = [UIColor clearColor];
		[self addSubview:textView01];
		[textView01 release];
        
        //各ページへと遷移するための画像ボタンを作成
        //撮影
		UIImage *Photographer = [UIImage imageNamed:@"btn_camera.png"];		
		UIButton *PhotographerImageButton = [[UIButton alloc] initWithFrame:CGRectMake(55, 360, Photographer.size.width, Photographer.size.height)];
		[PhotographerImageButton setBackgroundImage:Photographer forState:UIControlStateNormal];
		[PhotographerImageButton addTarget:self action:@selector(cameraAction) forControlEvents:UIControlEventTouchDown];
		[self addSubview:PhotographerImageButton];
		[PhotographerImageButton release];
        
        //レタッチ
		UIImage *retouch = [UIImage imageNamed:@"btn_retouch.png"];		
		UIButton *retouchImageButton = [[UIButton alloc] initWithFrame:CGRectMake(400, 360, retouch.size.width, retouch.size.height)];
		[retouchImageButton setBackgroundImage:retouch forState:UIControlStateNormal];
		[retouchImageButton addTarget:self action:@selector(retouchAction) forControlEvents:UIControlEventTouchDown];
		[self addSubview:retouchImageButton];
		[retouchImageButton release];
        
        //ビデオ
		UIImage *Video = [UIImage imageNamed:@"btn_Video.png"];		
		UIButton *VideoImageButton = [[UIButton alloc] initWithFrame:CGRectMake(55, 575, Video.size.width, Video.size.height)];
		[VideoImageButton setBackgroundImage:Video forState:UIControlStateNormal];
		[VideoImageButton addTarget:self action:@selector(VideoAction) forControlEvents:UIControlEventTouchDown];
		[self addSubview:VideoImageButton];
		[VideoImageButton release];
        
        //HP
		UIImage *HP = [UIImage imageNamed:@"btn_HP.png"];		
		UIButton *HPImageButton = [[UIButton alloc] initWithFrame:CGRectMake(400, 575, HP.size.width, HP.size.height)];
		[HPImageButton setBackgroundImage:HP forState:UIControlStateNormal];
		[HPImageButton addTarget:self action:@selector(HPAction) forControlEvents:UIControlEventTouchDown];
		[self addSubview:HPImageButton];
		[HPImageButton release];
        
        //print
		UIImage *print = [UIImage imageNamed:@"btn_print.png"];		
		UIButton *printImageButton = [[UIButton alloc] initWithFrame:CGRectMake(55, 790, print.size.width, print.size.height)];
		[printImageButton setBackgroundImage:print forState:UIControlStateNormal];
		[printImageButton addTarget:self action:@selector(PrintAction) forControlEvents:UIControlEventTouchDown];
		[self addSubview:printImageButton];
		[printImageButton release];
        
        //A-book
		UIImage *Abook = [UIImage imageNamed:@"btn_abook.png"];		
		UIButton *AbookImageButton = [[UIButton alloc] initWithFrame:CGRectMake(400, 790, Abook.size.width, Abook.size.height)];
		[AbookImageButton setBackgroundImage:Abook forState:UIControlStateNormal];
		[AbookImageButton addTarget:self action:@selector(AbookAction) forControlEvents:UIControlEventTouchDown];
		[self addSubview:AbookImageButton];
		[AbookImageButton release];
        
        
		
    }
    return self;
}

//コーヒーのボタンが押された時に呼ばれるメソッド
- (void)coffeeAction {
	//広告のポップアップを表示
	[popoverController presentPopoverFromRect:CGRectMake(55, 50, 10, 10) 
									   inView:self permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

//各ページへジャンプするメソッド
- (void)cameraAction {
	[slideDelegate jumpToViewController:1];
}

- (void)retouchAction {
	[slideDelegate jumpToViewController:2];
}

- (void)VideoAction {
	[slideDelegate jumpToViewController:3];
}

- (void)HPAction {
	[slideDelegate jumpToViewController:4];
}

- (void)PrintAction {
	[slideDelegate jumpToViewController:5];
}

- (void)AbookAction {
	[slideDelegate jumpToViewController:6];
}


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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesBegan:touches withEvent:event];
	UITouch *touch = [touches anyObject];
	CGPoint currentTouchPosition = [touch locationInView:self];
	
	//メイン画像タップでポップアップを表示
	if(CGRectContainsPoint(liveReportOneImageView.frame, currentTouchPosition)){
		
		UILabel *liveReportOneLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 150, 30)];
		liveReportOneLabel.text = @"トレッサ横浜";
		liveReportOneLabel.textAlignment = UITextAlignmentCenter;
		liveReportOneLabel.font = [UIFont boldSystemFontOfSize:16.0];
		liveReportOneLabel.textColor = [UIColor whiteColor];
		liveReportOneLabel.backgroundColor = [UIColor clearColor];
		
		//ポップアップ用ビューコントローラ
		PopoverViewController *popoverViewController = [[PopoverViewController alloc] initWithPopView:liveReportOneLabel];    		
		
		popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverViewController];
		popoverController.delegate = self;
		[popoverViewController release];
		[liveReportOneLabel release];
		
		[popoverController presentPopoverFromRect:CGRectMake(currentTouchPosition.x, currentTouchPosition.y, 10, 10) 
										   inView:self permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
	}
	
}


- (void)dealloc {
	[scrollView release];
	[pageControl release];
	[liveReportOneImageView release];
	[popoverController release];
    [super dealloc];
}


@end

