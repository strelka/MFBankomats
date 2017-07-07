//
//  MFBMapTableController.h
//  MFBankomats
//
//  Created by Jullia Sharaeva on 08.06.17.
//  Copyright © 2017 Julia Sharaeva. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@class MFBAnnotation;

@interface MFBMapTableDelegate : NSObject
@property (nonatomic, strong) NSMutableArray<MFBAnnotation*> *poiArray;

- (instancetype) initWithNavigationController:(UINavigationController*)nav;
- (CLLocationCoordinate2D) getCurrentUserCoordinate;
@end
