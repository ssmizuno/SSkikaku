//----------------------------------------------------------------------------//
//  PopoverViewController.m
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//

#import "PopoverViewController.h"


@implementation PopoverViewController

- (id)initWithPopView:(UIView *)popItemView {
	if((self = [super init])){
		self.contentSizeForViewInPopover = CGSizeMake(popItemView.frame.size.width+10, popItemView.frame.size.height+10); 
		UIView *popView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, popItemView.frame.size.width+10, popItemView.frame.size.height+10)];
		[popView addSubview:popItemView];
		self.view = popView;
		[popView release];
		
	}
	return self;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
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
    [super dealloc];
}


@end
