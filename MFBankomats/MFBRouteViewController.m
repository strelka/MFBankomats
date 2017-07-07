//
//  MFBRouteViewController.m
//  MFBankomats
//
//  Created by Jullia Sharaeva on 11.05.17.
//  Copyright © 2017 Julia Sharaeva. All rights reserved.
//
#import <MapKit/MapKit.h>
#import <Masonry/Masonry.h>
#import "MFBMapView.h"

#import "MFBRouteViewController.h"
#import "MFBMapViewDelegate.h"

@interface MFBRouteViewController ()<MFBMapViewDelegate, MKMapViewDelegate>
@property (nonatomic, strong) MKMapView *routeMap;
@end

@implementation MFBRouteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MFBMapView *mfbView  = [[MFBMapView alloc] initWithFrame:self.view.frame];
    mfbView.delegate = self;
    _routeMap = mfbView.mapView;
    _routeMap.delegate = self;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(_current, 1000, 1000);
    [_routeMap setRegion:region animated:YES];
    [self.view addSubview:mfbView];
    
    [_routeMap addAnnotation:_destination.annotation];
    [self getDirections];
}

-(void) getDirections
{
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    request.source = [MKMapItem mapItemForCurrentLocation];
    
    CLLocationCoordinate2D destinationCoords = _destination.annotation.coordinate;
    MKPlacemark *destinationPlacemark = [[MKPlacemark alloc] initWithCoordinate:destinationCoords addressDictionary:nil];
    MKMapItem *miDestination = [[MKMapItem alloc] initWithPlacemark:destinationPlacemark];
    
    request.destination = miDestination;
    request.requestsAlternateRoutes = NO;
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
    if (error) {
    }
    else {
            [self showRoute:response];
    }
    }];
}

-(void) showRoute:(MKDirectionsResponse*)response
{
    for (MKRoute *route in response.routes){
        [_routeMap addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
        
        for (MKRouteStep *step in route.steps){
            NSLog(@"%@,%f", step.instructions, step.distance);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    renderer.strokeColor = [UIColor blueColor];
    renderer.lineWidth = 5.0;
    return renderer;
}

- (void)zoomInButton{
    NSLog(@"ZoomIn");
    MKCoordinateRegion region = _routeMap.region;
    region.span.latitudeDelta /=2;
    region.span.longitudeDelta /=2;
    [_routeMap setRegion:region];
}

- (void)zoomOutButton{
    NSLog(@"ZoomOut");
    MKCoordinateRegion region = _routeMap.region;
    region.span.latitudeDelta *=2;
    region.span.longitudeDelta *=2;
    [_routeMap setRegion:region];
}

- (void) setCurrentUsersLocation{
    NSLog(@"currentLocation");
    MKCoordinateRegion region = _routeMap.region;
    region.center = _current;
    [_routeMap setRegion:region];
}

@end
