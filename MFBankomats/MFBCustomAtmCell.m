//
//  CustomAtmCell.m
//  MFBankomats
//
//  Created by Jullia Sharaeva on 08.06.17.
//  Copyright © 2017 Julia Sharaeva. All rights reserved.
//

#import "MFBCustomAtmCell.h"
#import <Masonry/Masonry.h>
NSString *const MFBCellIdentifier = @"MFBCellIdentifier";
@interface MFBCustomAtmCell()
@property (nonatomic, strong) UIImageView *atmIco;

@property (nonatomic, strong) UIImageView *walkIco;
@property (nonatomic, strong) UIImageView *autoIco;

@end

@implementation MFBCustomAtmCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        [self createSubviews];
        
    }
    return self;
}

- (void) createSubviews{
    _atmIco = [[UIImageView alloc] init];
    
    [self addSubview:self.atmIco];
    [self addSubview:self.address];
    [self initConstraints];
}

- (UILabel*)address{
    if (!_address){
        _address = [UILabel new];
        _address.lineBreakMode = NSLineBreakByWordWrapping;
        _address.font = [UIFont systemFontOfSize:14];
        _address.textColor = [UIColor darkGrayColor];
        _address.numberOfLines = 0;
        [_address sizeToFit];
        _address.textAlignment = NSTextAlignmentLeft;
    }
    return _address;
}


- (void) setAtmIcoFor:(int)openStatus{
    UIImage *atmImg;
    
    if (openStatus == -1) atmImg = [UIImage imageNamed:@"unknAtm"];
    if (openStatus ==  1) atmImg = [UIImage imageNamed:@"openAtm"];
    if (openStatus ==  0) atmImg = [UIImage imageNamed:@"closeAtm"];

    _atmIco.image = atmImg;
}


- (void) initConstraints{
    [_atmIco mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.height.equalTo(@30);
        make.width.equalTo(@30);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [_address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(35);
        make.right.equalTo(self.mas_right).with.offset(-60);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
}


@end
