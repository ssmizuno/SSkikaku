//----------------------------------------------------------------------------//
//  AGC_sampleProgram1_0AppDelegate.m
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//

#import "AGC_sampleProgram1_0AppDelegate.h"
#import "PageViewController.h"
#import "TopPageView.h"
#import "ContentTableViewController.h"

@implementation AGC_sampleProgram1_0AppDelegate

@synthesize window;
@synthesize navigationController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	//UISplitViewControllerクラスのインスタンスの作成
	splitViewController = [[UISplitViewController alloc] init];
	
	//目次用コントローラの作成
	ContentTableViewController *contentViewController = [[ContentTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
	contentViewController.tableView.scrollEnabled = YES;
	
	
	//TopPage用のコントローラの作成
	PageViewController *pageViewController = [[PageViewController alloc] initWithPageNumber:0];
	
	//複数のコントローラを管理するUINavigationControllerクラスインスタンスを作成
	navigationController = [[UINavigationController alloc] initWithRootViewController:pageViewController];
	//上部のナビゲーションバーを非表示
	navigationController.navigationBarHidden = YES;
	
	//左に目次コントローラ、右にページコントローラを設定
	splitViewController.viewControllers = [NSArray arrayWithObjects:contentViewController, navigationController, nil];
	splitViewController.view.backgroundColor = [UIColor blackColor];
	
	
	[window makeKeyAndVisible];
	[window addSubview:splitViewController.view];
	
	[contentViewController release];
	[pageViewController release];
    return YES;
}

//セルの文字背景
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	UIColor *col = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"001_01.png"]];
	[tableView setBackgroundColor:col];
	[col release];				
	
}


- (void)dealloc {
    [window release];
	[navigationController release];
	[splitViewController release];
    [super dealloc];
}


@end