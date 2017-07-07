//
//  MainTabBarController.m
//  MFBankomats
//
//  Created by Jullia Sharaeva on 10.05.17.
//  Copyright © 2017 Julia Sharaeva. All rights reserved.
//

#import "MFBTabBarController.h"
#import "MFBMapController.h"
#import "MFBTableViewController.h"

#import "MFBMapTableDelegate.h"

#import "MFBAnnotation.h"

@interface MFBTabBarController ()
@property (nonatomic, strong) MFBMapTableDelegate *mapTableDelegate;
@property (nonatomic, strong) UINavigationController *navController;
@end

@implementation MFBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _navController = [UINavigationController new];
    
    _mapTableDelegate = [[MFBMapTableDelegate alloc] initWithNavigationController:_navController];
    
    MFBMapController *mapController = [[MFBMapController alloc] initWithDelegate:_mapTableDelegate];
    MFBTableViewController *tableController = [[MFBTableViewController alloc] initWithDelegate:_mapTableDelegate];
    
    _navController.viewControllers = @[mapController];
    
    [self setViewControllers:@[_navController, tableController]];
    
    mapController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Карта"
                                                    image:[[UIImage imageNamed:@"map"] imageWithRenderingMode:UIImageRenderingModeAutomatic]
                                            selectedImage:[[UIImage imageNamed:@"map"] imageWithRenderingMode: UIImageRenderingModeAutomatic]];

    tableController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Список"
                                                             image:[[UIImage imageNamed:@"atm"] imageWithRenderingMode:UIImageRenderingModeAutomatic]
                                                     selectedImage:[[UIImage imageNamed:@"atm"] imageWithRenderingMode: UIImageRenderingModeAutomatic]];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
