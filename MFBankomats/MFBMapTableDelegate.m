//
//  MFBMapTableController.m
//  MFBankomats
//
//  Created by Jullia Sharaeva on 08.06.17.
//  Copyright © 2017 Julia Sharaeva. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "MFBMapTableDelegate.h"
#import "MFBAnnotation.h"

#import "MFBRouteViewController.h"
#import "MFBGetDataFromGoogle.h"

#import "AppDelegate.h"
#import "MFBCustomAtmCell.h"

@interface MFBMapTableDelegate () <MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) MKCoordinateRegion region;
@property (nonatomic, weak) UINavigationController *nav;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) id service;
@end

@implementation MFBMapTableDelegate
- (instancetype) initWithNavigationController:(UINavigationController*)nav{
    self = [super init];
    if (self){
        _nav = nav;
        _locationManager = ((AppDelegate *)[UIApplication sharedApplication].delegate).locationManager;
        _poiArray = [NSMutableArray new];
        _service = [MFBGetDataFromGoogle new];
    }
    return self;
}

- (CLLocationCoordinate2D) getCurrentUserCoordinate{
    return _locationManager.location.coordinate;
}


- (MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;

    if ([annotation isKindOfClass:[MFBAnnotation class]]) {
        MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"PinView"];
        if (!pinView) {
                MFBAnnotation *myLocation = (MFBAnnotation*) annotation;
                pinView = myLocation.annotationView;
            } else {
                pinView.annotation = annotation;
            }
        
        MFBAnnotation *mfbannotation = (MFBAnnotation*)annotation;
        [_poiArray addObject:mfbannotation];
        
        pinView.pinTintColor = [mfbannotation getColorForAnnotation];
        return pinView;
    }
    return nil;
}


-(void)mapView:(MKMapView *)mapView annotationView:(nonnull MKAnnotationView *)view calloutAccessoryControlTapped:(nonnull UIControl *)control
{
    if ([control tag] == 1){
        MFBRouteViewController *rvc = [MFBRouteViewController new];
        rvc.destination = view;
        rvc.current = mapView.userLocation.location.coordinate;
        [_nav pushViewController:rvc animated:YES];
    }
}

- (void) mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    _region = mapView.region;
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    
    NSLog(@"regionDidChangeAnimated");
    
    MKCoordinateRegion newRegion;
    
    newRegion = mapView.region;
    
    if ((fabs(_region.span.latitudeDelta - newRegion.span.latitudeDelta) > 0.01)
        ||(fabs(_region.span.longitudeDelta - newRegion.span.longitudeDelta) > 0.01)) //{
        
        NSLog(@"change!");
    
        NSLog(@"%f-%f",newRegion.center.longitude, newRegion.center.latitude);
    
        [[MFBGetDataFromGoogle new] getDataforName:@"sberbank" andCord:newRegion.center andComplition:^(NSMutableArray *data) {
            if (data){
                NSMutableArray *pins = [[NSMutableArray alloc] initWithArray:[mapView annotations]];
                [mapView removeAnnotations:pins];
                [_poiArray removeAllObjects];
                pins = nil;
                [mapView addAnnotations:data];
            }
        }];
    //}
    [mapView setRegion:newRegion];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MFBCustomAtmCell *cell = (MFBCustomAtmCell*)[tableView dequeueReusableCellWithIdentifier:@"TableItem" forIndexPath:indexPath];
    MFBAnnotation *annotation = _poiArray[indexPath.row];
    
    if (cell == nil){
        cell = [[MFBCustomAtmCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableItem"];
    }
    
    MFBCustomAtmCell *mfbcell = (MFBCustomAtmCell*)cell;
    mfbcell.address.text = annotation.title;
    [mfbcell setAtmIcoFor:annotation.isOpen];
    return mfbcell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_poiArray count];
}
@end
