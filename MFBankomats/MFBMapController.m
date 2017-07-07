 //
//  MSFMapController.m
//  MFBankomats
//
//  Created by Jullia Sharaeva on 08.05.17.
//  Copyright © 2017 Julia Sharaeva. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <Masonry/Masonry.h>
#import "MFBMapController.h"
#import "MFBMapView.h"

#import "MFBAnnotation.h"

#import "MFBMapTableDelegate.h"
#import "MFBMapViewDelegate.h"

@interface MFBMapController ()<MFBMapViewDelegate>

@property (nonatomic, weak) id mapDelegate;
@property (nonatomic, strong) MKMapView *mapView;

@end

@implementation MFBMapController

- (instancetype) initWithDelegate:(id)mapDelegate{
    self = [super init];
    if (self) {
        _mapDelegate = mapDelegate;
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    MFBMapView *mfbView  = [[MFBMapView alloc] initWithFrame:self.view.frame];
    mfbView.delegate = self;
    _mapView = mfbView.mapView;
    _mapView.delegate = _mapDelegate;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([_mapDelegate getCurrentUserCoordinate], 1000, 1000);
    [_mapView setRegion:region animated:YES];
    [self.view addSubview:mfbView];
    
}

- (void)zoomInButton{
    NSLog(@"ZoomIn");
    MKCoordinateRegion region = _mapView.region;
    region.span.latitudeDelta /=2;
    region.span.longitudeDelta /=2;
    [_mapView setRegion:region];
}

- (void)zoomOutButton{
    NSLog(@"ZoomOut");
    MKCoordinateRegion region = _mapView.region;
    region.span.latitudeDelta *=2;
    region.span.longitudeDelta *=2;
    [_mapView setRegion:region];
}

- (void) setCurrentUsersLocation{
    NSLog(@"currentLocation");
    MKCoordinateRegion region = _mapView.region;
    region.center = [_mapDelegate getCurrentUserCoordinate];
    [_mapView setRegion:region];
}

@end;
