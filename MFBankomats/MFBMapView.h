//
//  MFBMapView.h
//  MFBankomats
//
//  Created by Jullia Sharaeva on 08.06.17.
//  Copyright © 2017 Julia Sharaeva. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MFBMapViewDelegate;
@class MKMapView;

@interface MFBMapView : UIView
@property(nonatomic, strong) MKMapView* mapView;
@property(nonatomic) id<MFBMapViewDelegate> delegate;

@end
