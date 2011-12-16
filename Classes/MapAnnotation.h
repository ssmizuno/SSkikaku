//----------------------------------------------------------------------------//
//  MapAnnotation.h
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface MapAnnotation : NSObject <MKAnnotation>{
	CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;
	
}
@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
//@property(nonatomic, retain) NSString *title;
//@property(nonatomic, retain) NSString *subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coord;
@end
