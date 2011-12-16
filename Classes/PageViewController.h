//----------------------------------------------------------------------------//
//  PageViewController.h
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//

#import <UIKit/UIKit.h>
#import "SlideView.h"

//SlideViewDelegateを採用
@interface PageViewController : UIViewController <SlideViewDelegate> {
	int pageCount;
}
- (id)initWithPageNumber:(int)page;
@end

