//----------------------------------------------------------------------------//
//  ContentTableViewController.m
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//

#import "ContentTableViewController.h"
#import "AGC_sampleProgram1_0AppDelegate.h"
#import "PageViewController.h"

@implementation ContentTableViewController
//@synthesize contentDelegate;

#pragma mark -
#pragma mark Initialization


- (id)initWithStyle:(UITableViewStyle)style {
    if ((self = [super initWithStyle:style])) {
		//ロゴ画像を表示
		UIImage *logoImage = [UIImage imageNamed:@"Logo.png"] ;
		UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 700, 100, 44)];
		logoImageView.image = logoImage;
		logoImageView.backgroundColor = [UIColor clearColor];
		[self.view addSubview:logoImageView];
		[logoImageView release];
		
    }
    return self;
}



#pragma mark -
#pragma mark View lifecycle


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


#pragma mark -
#pragma mark Table view data source

//セクションの数を指定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

//行の数を指定
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 7;
}

//セクションヘッダに表示するテキストを指定
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {	
	NSString *r = @"CONTENTS";
	return r;
}

//各テーブルセルの内容を指定
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	//各行に表示するテキストを指定
	switch (indexPath.row) {
		case 0:
			cell.textLabel.text = @"TOP";
			break;
		case 1:
			cell.textLabel.text = @"写真撮影";
			break;
		case 2:
			cell.textLabel.text = @"3DCG 修正・レタッチ";
			break;
		case 3:
			cell.textLabel.text = @"ビデオ制作";
			break;
        case 4:
			cell.textLabel.text = @"ホームページ制作";
			break;
        case 5:
			cell.textLabel.text = @"写真プリント　パネル加工";
			break;
        case 6:
			cell.textLabel.text = @"A-book";
			break;
			
		default:
			break;
	}
    
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

//行がタップされた時に呼ばれるメソッド
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//選択を解除
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	//ナビゲーションコントローラスタックの
	//一番上にあるPageViewController に対してjumpToViewControllerメソッドを実行
	[(PageViewController *)[[(AGC_sampleProgram1_0AppDelegate *)[[UIApplication sharedApplication] delegate] navigationController] topViewController] 
	 jumpToViewController:indexPath.row];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
