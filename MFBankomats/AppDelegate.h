//
//  AppDelegate.h
//  MFBankomats
//
//  Created by Jullia Sharaeva on 07.05.17.
//  Copyright © 2017 Julia Sharaeva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@class CLLocationManager;

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

