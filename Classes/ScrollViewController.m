//----------------------------------------------------------------------------//
//  ScrollViewController.m
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//

#import "ScrollViewController.h"


@implementation ScrollViewController

//サンプルページの番号からイメージを読み込む
- (id)initWithImageNumber:(int)page {
	if ((self = [super init])) {
		pageNumber = page;
		
		//ツールバーに設置するボタンを作成
		UIBarButtonItem *removeButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop
																					  target:self action:@selector(removeAction)];
		UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"◀" style:UIBarButtonItemStylePlain 
																	  target:self action:@selector(backAction)];
		UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"▶" style:UIBarButtonItemStylePlain 
																	  target:self action:@selector(nextAction)];
		
		//ページ番号により、次へと前へボタンを不能にする
		if (page == 1) {
			backButton.enabled = NO;
		}else if (page == 14) {
			nextButton.enabled = NO;
		}
		
		NSArray *toolBarItems = [NSArray arrayWithObjects:
								 removeButton,
								 [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease],
								 backButton,
								 
								 [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease],
								 nextButton,
								 [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease],
								 nil
								 ];
		self.toolbarItems = toolBarItems;
		[removeButton release];
		[backButton release];
		[nextButton release];
		
		//サンプルページの画像を読み込み
		UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"abook_0%02d.png",page]];
		imageScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
		imageScrollView.backgroundColor = [UIColor blackColor];
		imageView = [[UIImageView alloc] initWithImage:image];		
		imageScrollView.contentSize = image.size;
		imageScrollView.delegate = self;
		imageScrollView.scrollEnabled = YES;		
		imageScrollView.bounces = YES;
		imageScrollView.bouncesZoom = YES;
		imageScrollView.maximumZoomScale = 2.0;
		
        /*
		//スクロールビューの初期拡大率を指定
		initialScale = 960/image.size.height;
		if(page > 1){
			imageScrollView.minimumZoomScale = 768/image.size.width;
		}else {
			imageScrollView.minimumZoomScale = initialScale;			
		}
         */
		
		[imageScrollView setZoomScale:initialScale];
		//始めは画像の右端が表示されているように調整
		[imageScrollView scrollRectToVisible:CGRectMake(imageScrollView.contentSize.width/2, 0, 768, 960) animated:NO];
		
		[imageScrollView addSubview:imageView];
		self.view = imageScrollView;		
		
	}
	return self;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
	return imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView 	withView:(UIView *)view atScale:(float)scale 
{	
	[scrollView setZoomScale:scale];
}

//次のサンプルページへ遷移
- (void)nextAction {
	ScrollViewController *nextScrollViewController = [[ScrollViewController alloc] initWithImageNumber:pageNumber+1];
	[self.navigationController pushViewController:nextScrollViewController animated:YES];
	[nextScrollViewController release];
}

//前のサンプルページへ遷移
- (void)backAction {
	[self.navigationController popViewControllerAnimated:YES];
}

//サンプルページの閲覧を終了
- (void)removeAction {
	[UIView beginAnimations:@"Disappear" context:NULL];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(disappearAnimationDidStop)];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	self.navigationController.view.alpha = 0.0;
	[UIView commitAnimations];
	
}

//フェードアウトアニメーション
- (void)disappearAnimationDidStop {
	[self.navigationController.view removeFromSuperview];
	
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:YES];
	//初期拡大率
	[imageScrollView setZoomScale:initialScale];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[imageView release];
	[imageScrollView release];
    [super dealloc];
}


@end
