//----------------------------------------------------------------------------//
//  AGC_sampleProgram1_0AppDelegate.h
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//

#import <UIKit/UIKit.h>

@interface AGC_sampleProgram1_0AppDelegate : NSObject <UIApplicationDelegate, UISplitViewControllerDelegate> {
    UIWindow *window;
	UISplitViewController *splitViewController;
	UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;

@end

