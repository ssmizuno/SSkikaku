//----------------------------------------------------------------------------//
//  PageViewController.m
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//

#import "PageViewController.h"
#import "TopPageView.h"
#import "SecondPageView.h"
#import "ThirdPageView.h"
#import "IndexPageView.h"
#import "ForthPageView.h"
#import "FifthPageView.h"
#import "SixthPageView.h"

@implementation PageViewController

//初期化の際にページ番号を受け取る
- (id)initWithPageNumber:(int)page {
    if ((self = [super init])) {
		pageCount = page;
    }
    return self;
}

//ページ番号に応じて各ページを作成してセット
- (void)loadView {
	UIView *pageView;
	CGRect frame = CGRectMake(0, 20, 768, 1004);
	switch (pageCount) {
		case 0:
			pageView = [[IndexPageView alloc] initWithFrame:frame];
			((IndexPageView *)pageView).slideDelegate = self;
			break;
		case 1:
			pageView = [[TopPageView alloc] initWithFrame:frame];
			((TopPageView *)pageView).slideDelegate = self;
			break;
		case 2:
			pageView = [[SecondPageView alloc] initWithFrame:frame];
			((SecondPageView *)pageView).slideDelegate = self;
			break;
		case 3:
			pageView = [[ThirdPageView alloc] initWithFrame:frame];
			((ThirdPageView *)pageView).slideDelegate = self;
			break;
        case 4:
			pageView = [[ForthPageView alloc] initWithFrame:frame];
			((ForthPageView *)pageView).slideDelegate = self;
			break;
        case 5:
			pageView = [[FifthPageView alloc] initWithFrame:frame];
			((FifthPageView *)pageView).slideDelegate = self;
			break;
        case 6:
			pageView = [[SixthPageView alloc] initWithFrame:frame];
			((SixthPageView *)pageView).slideDelegate = self;
			break;
			
	}
	
	self.view = pageView;
	[pageView release];
}

//次のページを作成して遷移するメソッド
- (void)pushNextViewController {
	if(pageCount < 6){		
		PageViewController *nextViewController = [[PageViewController alloc] initWithPageNumber:pageCount+1];
		[[self navigationController] pushViewController:nextViewController animated:YES];
		[nextViewController release];
	}
}

//前のページへ遷移するメソッド
- (void)popCurrentViewController {
	[[self navigationController] popViewControllerAnimated:YES];
}

//指定のページへ遷移するメソッド
- (void)jumpToViewController:(int)page {
	//現在のページ数と遷移先のページを比べて処理を変更
	switch (pageCount) {
        case 0:
		{
            //２ページ
			if(page > 0){
				PageViewController *nextViewController = [[PageViewController alloc] initWithPageNumber:1];	
				
                //３ページ
                if (page > 1) {
					PageViewController *next02ViewController = [[PageViewController alloc] initWithPageNumber:2];	
					
					NSMutableArray *array = [NSMutableArray arrayWithArray:[self.navigationController viewControllers]];
					[array addObject:nextViewController];
					
					//４ページ
                    if (page > 2) {
						
						PageViewController *next03ViewController = [[PageViewController alloc] initWithPageNumber:3];	
						
						[array addObject:next02ViewController];
                        
                        //５ページ
                        if (page > 3) {
                            
                            PageViewController *next04ViewController = [[PageViewController alloc] initWithPageNumber:4];	
                            
                            [array addObject:next03ViewController];
                            
                            //６ページ
                            if (page > 4) {
                                
                                PageViewController *next05ViewController = [[PageViewController alloc] initWithPageNumber:5];	
                                
                                [array addObject:next04ViewController];
                                
                                //７ページ
                                if (page > 5) {
                                    PageViewController *lastViewController = [[PageViewController alloc] initWithPageNumber:6];	
                                    [array addObject:next05ViewController];
                                    
                                    self.navigationController.viewControllers = array;
                                    [[self navigationController] pushViewController:lastViewController animated:YES];
                                    
                                    [lastViewController release];
                                    
                                }else {
                                    self.navigationController.viewControllers = array;
                                    [[self navigationController] pushViewController:next05ViewController animated:YES];
                                }
                                [next05ViewController release];
                                
                            }else {
                                self.navigationController.viewControllers = array;
                                [[self navigationController] pushViewController:next04ViewController animated:YES];
                            }
                            [next04ViewController release];
                            
                        }else {
                            self.navigationController.viewControllers = array;
                            [[self navigationController] pushViewController:next03ViewController animated:YES];
                        }
                        [next03ViewController release];
                        
                    }else {
                        self.navigationController.viewControllers = array;
                        [[self navigationController] pushViewController:next02ViewController animated:YES];
                    }
                    [next02ViewController release];
					
				}else {
					[[self navigationController] pushViewController:nextViewController animated:YES];
				}
				[nextViewController release];				
			}	
			break;
		}

            /*
        case 0:
		{
			if(page > 0){
				PageViewController *nextViewController = [[PageViewController alloc] initWithPageNumber:1];	
				if (page > 1) {
					PageViewController *afterNextViewController = [[PageViewController alloc] initWithPageNumber:2];	
					
					NSMutableArray *array = [NSMutableArray arrayWithArray:[self.navigationController viewControllers]];
					[array addObject:nextViewController];
					
					if (page > 2) {
						
						PageViewController *lastViewController = [[PageViewController alloc] initWithPageNumber:3];	
						
						[array addObject:afterNextViewController];
						self.navigationController.viewControllers = array;
						[[self navigationController] pushViewController:lastViewController animated:YES];
						[lastViewController release];
					}else {
						
						self.navigationController.viewControllers = array;
						[[self navigationController] pushViewController:afterNextViewController animated:YES];
					}
					[afterNextViewController release];				
					
				}else {
					[[self navigationController] pushViewController:nextViewController animated:YES];
				}
				[nextViewController release];				
			}	
			break;
		}
            */
            
        case 1:
		{
			if (page == 0) {
				[[self navigationController] popViewControllerAnimated:YES];
			}else if(page > 1){
				PageViewController *nextViewController = [[PageViewController alloc] initWithPageNumber:2];	
                
                if (page > 2) {
					PageViewController *next02ViewController = [[PageViewController alloc] initWithPageNumber:3];	
					
					NSMutableArray *array = [NSMutableArray arrayWithArray:[self.navigationController viewControllers]];
					[array addObject:nextViewController];
					
					//４ページ
                    if (page > 3) {
						
						PageViewController *next03ViewController = [[PageViewController alloc] initWithPageNumber:4];	
						
						[array addObject:next02ViewController];
                        
                        //５ページ
                        if (page > 4) {
                            
                            PageViewController *next04ViewController = [[PageViewController alloc] initWithPageNumber:5];	
                            
                            [array addObject:next03ViewController];
                            //７ページ
                            if (page > 5) {
                                    PageViewController *lastViewController = [[PageViewController alloc] initWithPageNumber:6];	
                                    [array addObject:next04ViewController];
                                    
                                    self.navigationController.viewControllers = array;
                                    [[self navigationController] pushViewController:lastViewController animated:YES];
                                    
                                    [lastViewController release];
                            
                            }else {
                                self.navigationController.viewControllers = array;
                                [[self navigationController] pushViewController:next04ViewController animated:YES];
                            }
                            [next04ViewController release];
                            
                        }else {
                            self.navigationController.viewControllers = array;
                            [[self navigationController] pushViewController:next03ViewController animated:YES];
                        }
                        [next03ViewController release];
                        
                    }else {
                        self.navigationController.viewControllers = array;
                        [[self navigationController] pushViewController:next02ViewController animated:YES];
                    }
                    [next02ViewController release];
					
				}else {
					[[self navigationController] pushViewController:nextViewController animated:YES];
				}
				[nextViewController release];				
			}
			break;
		}
		
        /*
		case 1:
		{
			if (page == 0) {
				[[self navigationController] popViewControllerAnimated:YES];
			}else if(page > 1){
				PageViewController *nextViewController = [[PageViewController alloc] initWithPageNumber:2];	
				if(page > 2){
					PageViewController *afterNextViewController = [[PageViewController alloc] initWithPageNumber:3];
					
					NSMutableArray *array = [NSMutableArray arrayWithArray:[self.navigationController viewControllers]];
					[array addObject:nextViewController];
					self.navigationController.viewControllers = array;
					[[self navigationController] pushViewController:afterNextViewController animated:YES];
					[afterNextViewController release];		
				}else {
					[[self navigationController] pushViewController:nextViewController animated:YES];
				}
				[nextViewController release];
			}
			break;
		}
         */
        case 2:
		{
			if(page == 0){
				[[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:0] animated:YES];
			}else if(page == 1){
				[[self navigationController] popViewControllerAnimated:YES];
			}else if(page > 2){
				PageViewController *nextViewController = [[PageViewController alloc] initWithPageNumber:3];	
                
                if (page > 3) {
					PageViewController *next02ViewController = [[PageViewController alloc] initWithPageNumber:4];	
					
					NSMutableArray *array = [NSMutableArray arrayWithArray:[self.navigationController viewControllers]];
					[array addObject:nextViewController];
					
					//４ページ
                    if (page > 4) {
						
						PageViewController *next03ViewController = [[PageViewController alloc] initWithPageNumber:5];	
						
						[array addObject:next02ViewController];
                        
                        if (page > 5) {
                                PageViewController *lastViewController = [[PageViewController alloc] initWithPageNumber:6];	
                                [array addObject:next03ViewController];
                                
                                self.navigationController.viewControllers = array;
                                [[self navigationController] pushViewController:lastViewController animated:YES];
                                
                                [lastViewController release];
                            
                        }else {
                            self.navigationController.viewControllers = array;
                            [[self navigationController] pushViewController:next03ViewController animated:YES];
                        }
                        [next03ViewController release];
                        
                    }else {
                        self.navigationController.viewControllers = array;
                        [[self navigationController] pushViewController:next02ViewController animated:YES];
                    }
                    [next02ViewController release];
					
				}else {
					[[self navigationController] pushViewController:nextViewController animated:YES];
				}
				[nextViewController release];				
			}
			break;
		}
        /*
		case 2:
		{
			if(page == 0){
				[[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:0] animated:YES];
			}else if(page == 1){
				[[self navigationController] popViewControllerAnimated:YES];
			}else if(page == 3){
				PageViewController *nextViewController = [[PageViewController alloc] initWithPageNumber:3];	
				[[self navigationController] pushViewController:nextViewController animated:YES];
				[nextViewController release];
			}
			break;
		}
         */
        case 3:
		{
			if(page == 0){
				[[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:0] animated:YES];
			}else if(page == 1){
				[[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:1] animated:YES];
			}else if(page == 2){
				[[self navigationController] popViewControllerAnimated:YES];
			}else if(page > 3){
				PageViewController *nextViewController = [[PageViewController alloc] initWithPageNumber:4];	
                
                if (page > 4) {
					PageViewController *next02ViewController = [[PageViewController alloc] initWithPageNumber:5];	
					
					NSMutableArray *array = [NSMutableArray arrayWithArray:[self.navigationController viewControllers]];
					[array addObject:nextViewController];
					
					if (page > 5) {
                            PageViewController *lastViewController = [[PageViewController alloc] initWithPageNumber:6];	
                            [array addObject:next02ViewController];
                            
                            self.navigationController.viewControllers = array;
                            [[self navigationController] pushViewController:lastViewController animated:YES];
                            
                            [lastViewController release];
                            
                        }else {
                        self.navigationController.viewControllers = array;
                        [[self navigationController] pushViewController:next02ViewController animated:YES];
                    }
                    [next02ViewController release];
					
				}else {
					[[self navigationController] pushViewController:nextViewController animated:YES];
				}
				[nextViewController release];				
			}
			break;
		}
            
        /*
		case 3:
		{
			if(page == 0){
				[[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:0] animated:YES];
			}else if(page == 1){
				[[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:1] animated:YES];
			}else if(page == 2){
				[[self navigationController] popViewControllerAnimated:YES];
			}
			break;
		}
         */
        case 4:
		{
			if(page == 0){
				[[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:0] animated:YES];
			}else if(page == 1){
				[[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:1] animated:YES];
            }else if(page == 2){
				[[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:2] animated:YES];
			}else if(page == 3){
				[[self navigationController] popViewControllerAnimated:YES];
			}else if(page > 4){
				PageViewController *nextViewController = [[PageViewController alloc] initWithPageNumber:5];	
				if(page > 5){
					PageViewController *afterNextViewController = [[PageViewController alloc] initWithPageNumber:6];
					
					NSMutableArray *array = [NSMutableArray arrayWithArray:[self.navigationController viewControllers]];
					[array addObject:nextViewController];
					self.navigationController.viewControllers = array;
					[[self navigationController] pushViewController:afterNextViewController animated:YES];
					[afterNextViewController release];		
				}else {
					[[self navigationController] pushViewController:nextViewController animated:YES];
				}
				[nextViewController release];
			}
            break;
		}
        case 5:
		{
			if(page == 0){
				[[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:0] animated:YES];
			}else if(page == 1){
				[[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:1] animated:YES];
            }else if(page == 2){
				[[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:2] animated:YES];
            }else if(page == 3){
				[[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:3] animated:YES];
			}else if(page == 4){
				[[self navigationController] popViewControllerAnimated:YES];
			}else if(page == 6){
				PageViewController *nextViewController = [[PageViewController alloc] initWithPageNumber:6];	
				[[self navigationController] pushViewController:nextViewController animated:YES];
				[nextViewController release];
			}
			break;
		}
        case 6:
        {
            if(page == 0){
                [[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:0] animated:YES];
            }else if(page == 1){
                [[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:1] animated:YES];
            }else if(page == 2){
                [[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:2] animated:YES];
            }else if(page == 3){
                [[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:3] animated:YES];
            }else if(page == 4){
                [[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:4] animated:YES];
            }else if(page == 5){
                [[self navigationController] popViewControllerAnimated:YES];
            }
            break;
        }
			
		default:
			break;
	}
         
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:YES];
	//表示時の画面の縦横を認識してビューのスクロールを制御
	if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		((UIScrollView *)self.view).contentOffset = CGPointMake(0, 0);
		((UIScrollView *)self.view).scrollEnabled = YES;
		
	}else {
		((UIScrollView *)self.view).scrollEnabled = NO;		
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	//回転時の画面の縦横を認識してビューのスクロールを制御
	if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		((UIScrollView *)self.view).contentOffset = CGPointMake(0, 0);
		((UIScrollView *)self.view).scrollEnabled = YES;
	}else {
		((UIScrollView *)self.view).scrollEnabled = NO;		
	}
	return YES;
}

//回転開始時に呼ばれるメソッド
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration 
{
	//4ページ目の本のサンプルが出ていた場合に閉じる処理
	if(pageCount == 6){
		if([[self.view subviews] containsObject:((SixthPageView *)[self view]).AbookNavigationController.view]){
            [((SixthPageView *)[self view]).AbookNavigationController.view removeFromSuperview];
		}
	}
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
    [super dealloc];
}

@end