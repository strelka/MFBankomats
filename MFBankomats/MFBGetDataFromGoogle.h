//
//  MFBGetDataFromGoogle.h
//  MFBankomats
//
//  Created by Jullia Sharaeva on 08.05.17.
//  Copyright © 2017 Julia Sharaeva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class MFBAnnotation;

@interface MFBGetDataFromGoogle : NSObject
- (void) getDataforName:(NSString*)name
                andCord:(CLLocationCoordinate2D)cord
          andComplition:(void(^)(NSMutableArray* data)) block;

- (void) getDistanceFromPoint:(CLLocationCoordinate2D)pointA
                      ToPoint:(CLLocationCoordinate2D)pointB
                      andMode:(NSString*)mode
                andComplition:(void(^)()) block;
@end
