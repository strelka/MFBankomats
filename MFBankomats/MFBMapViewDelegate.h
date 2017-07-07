//
//  MFBMapViewDelegate.h
//  MFBankomats
//
//  Created by Jullia Sharaeva on 08.06.17.
//  Copyright © 2017 Julia Sharaeva. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MFBMapViewDelegate <NSObject>
@required
- (void)zoomInButton;
- (void)zoomOutButton;
- (void)setCurrentUsersLocation;
@end
