//
//  MFBAnnotation.m
//  MFBankomats
//
//  Created by Jullia Sharaeva on 08.05.17.
//  Copyright © 2017 Julia Sharaeva. All rights reserved.
//

#import "MFBAnnotation.h"
#import <MapKit/MapKit.h>
#import "MFBRouteViewController.h"

@implementation MFBAnnotation

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate{
    _coordinate = newCoordinate;
}

-(instancetype) initWithName:(NSString*)name andCoordinate:(CLLocationCoordinate2D)cord andisOpen:(int)isOpen{
    self = [super init];
    if (self){
        _coordinate = cord;
        _title = name;
        _isOpen = isOpen;
    }
    return self;
}

- (UIColor*) getColorForAnnotation{
    UIColor *color;
    if (_isOpen == -1) color = [UIColor lightGrayColor];
    if (_isOpen ==  1) color = [UIColor greenColor];
    if (_isOpen ==  0) color = [UIColor redColor];
    
    return color;
}
    
-(MKPinAnnotationView *)annotationView
{
    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"PinView"];
    
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    //annotationView.pinTintColor = _color;
    
    UIButton *drawRouteBtn = [[UIButton alloc] init];
    [drawRouteBtn setImage:[UIImage imageNamed:@"route"] forState:UIControlStateNormal];
    //UIButton *infoBtn = [UIButton buttonWithType:UIButtonTypeInfoLight];
    
    drawRouteBtn.tag = 1;
    //infoBtn.tag = 2;
    
    annotationView.rightCalloutAccessoryView = drawRouteBtn;
    //annotationView.leftCalloutAccessoryView = infoBtn;
    
    return annotationView;
}

@end
