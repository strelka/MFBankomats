//
//  MFBMapView.m
//  MFBankomats
//
//  Created by Jullia Sharaeva on 08.06.17.
//  Copyright © 2017 Julia Sharaeva. All rights reserved.
//

#import "MFBMapView.h"
#import <Masonry/Masonry.h>
#import <MapKit/MapKit.h>

#import "MFBMapViewDelegate.h"

@interface MFBMapView()


@property (nonatomic, strong) UIButton *btnZoomIn;
@property (nonatomic, strong) UIButton *btnZoomOut;
@property (nonatomic, strong) UIButton *btnCurrentLocation;

@end

@implementation MFBMapView

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.mapView];
        [_mapView addSubview:self.btnZoomIn];
        [_mapView addSubview:self.btnZoomOut];
        [_mapView addSubview:self.btnCurrentLocation];
        
        [self initConstraints];
        [_mapView setShowsScale:YES];
        [_mapView setShowsUserLocation:YES];

    }
    return self;
}

- (MKMapView *) mapView{
    if (!_mapView){
        _mapView = [[MKMapView alloc] init];
        _mapView.showsUserLocation = YES;
    }
    return _mapView;
}

- (UIButton *)btnZoomIn{
    if (!_btnZoomIn){
        _btnZoomIn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnZoomIn setImage:[UIImage imageNamed:@"inBtn"] forState:UIControlStateNormal];
        [_btnZoomIn addTarget:_delegate action:@selector(zoomInButton) forControlEvents:UIControlEventTouchDown];
    }
    return _btnZoomIn;
}

- (UIButton *)btnZoomOut{
    if (!_btnZoomOut){
        _btnZoomOut = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnZoomOut setImage:[UIImage imageNamed:@"outBtn"] forState:UIControlStateNormal];
        [_btnZoomOut addTarget:_delegate action:@selector(zoomOutButton) forControlEvents:UIControlEventTouchDown];
    }
    return _btnZoomOut;
}

- (UIButton *)btnCurrentLocation{
    if (!_btnCurrentLocation){
        _btnCurrentLocation = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnCurrentLocation setImage:[UIImage imageNamed:@"currentLoc"] forState:UIControlStateNormal];
        [_btnCurrentLocation addTarget:_delegate action:@selector(setCurrentUsersLocation) forControlEvents:UIControlEventTouchDown];
    }
    return _btnCurrentLocation;
}

- (void) zoomInButton{
    [_delegate zoomInButton];
}

- (void) zoomOutButton{
    [_delegate zoomOutButton];
}

- (void) setCurrentUsersLocation{
    [_delegate setCurrentUsersLocation];
}

-(void)initConstraints
{
    self.mapView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.btnZoomOut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.offset(-80);
        make.left.equalTo(self.mas_left).with.offset(10);
    }];

    [self.btnZoomIn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.offset(-110);
        make.left.equalTo(self.mas_left).with.offset(10);
    }];
    
    [self.btnCurrentLocation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.offset(-140);
        make.left.equalTo(self.mas_left).with.offset(10);
    }];
}


@end
