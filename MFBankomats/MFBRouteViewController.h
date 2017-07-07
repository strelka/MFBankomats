//
//  MFBRouteViewController.h
//  MFBankomats
//
//  Created by Jullia Sharaeva on 11.05.17.
//  Copyright © 2017 Julia Sharaeva. All rights reserved.
//

#import "MFBMapController.h"
#import <UIKit/UIKit.h>
@class MFBAnnotation;

@interface MFBRouteViewController : MFBMapController
@property(nonatomic) CLLocationCoordinate2D current;
@property(nonatomic, strong) MKAnnotationView *destination;

@end
