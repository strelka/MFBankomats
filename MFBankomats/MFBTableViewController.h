//
//  MFBTableViewController.h
//  MFBankomats
//
//  Created by Jullia Sharaeva on 10.05.17.
//  Copyright © 2017 Julia Sharaeva. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MFBAnnotation;
@class CLLocationManager;

@interface MFBTableViewController : UIViewController
- (instancetype) initWithDelegate:(id)tableDelegate;
@end
