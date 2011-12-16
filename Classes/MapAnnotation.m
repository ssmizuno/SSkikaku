//----------------------------------------------------------------------------//
//  MapAnnotation.m
//  AGC旭硝子様_サンプルアプリ
//  
//  Created by Masashi Mizuno.
//  Creation date    2011/02/22
//  Last update date 
//  Copyright ss kikaku ltd,. All rights reserved.
//----------------------------------------------------------------------------//
//


#import "MapAnnotation.h"


@implementation MapAnnotation
@synthesize coordinate, title, subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coord {
	coordinate = coord;
	return self;
}

@end