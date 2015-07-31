//
//  KKGiftCell.m
//  KK
//
//  Created by lee pengfei on 15/6/6.
//  Copyright (c) 2015年 WX. All rights reserved.
//

#import "KKGiftCell.h"

@implementation KKGiftCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        WS(weakSelf);
        bgView=[UIView new];
        [self addSubview:bgView];
        bgView.backgroundColor=KKTableViewCellColor;
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.mas_equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0,0, 4, 0));
            
        }];
        
        UIView * lineView=[UIView new];
        [self addSubview:lineView];
        lineView.backgroundColor=ZXLineColor;
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.bottom.equalTo(weakSelf).with.offset(-3);
            make.left.equalTo(weakSelf).with.offset(0);
            make.right.equalTo(weakSelf).with.offset(0);
            make.height.mas_equalTo(@1);
            
        }];
        
        __weak UIView * weakBgView=bgView;
        
        iv=[UIImageView new];
        iv.backgroundColor=[UIColor clearColor];
        iv.layer.masksToBounds=YES;
        iv.layer.cornerRadius=18;
        [bgView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakBgView).with.offset(10);
            make.left.equalTo(weakBgView).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(75, 75));
        }];
        
        __weak UIImageView * weakIV=iv;
        titleLabel=[UILabel new];
        [bgView addSubview:titleLabel];
        titleLabel.font=FONTSIZEBIG;
        titleLabel.textColor=FONTColorBlack;
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakBgView).with.offset(11);
            make.left.equalTo(weakIV.mas_right).with.offset(8);
            make.right.equalTo(weakBgView).with.offset(-50);
            make.height.mas_equalTo(@20);
        }];
        
        
        infoLabel=[UILabel new];
        [bgView addSubview:infoLabel];
        infoLabel.numberOfLines=0;
        infoLabel.font=FONTSIZEMiddle;
        infoLabel.textColor=FONTColorLight;
        infoLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakBgView).with.offset(30);
            make.left.equalTo(weakIV.mas_right).with.offset(8);
            make.right.equalTo(weakBgView).with.offset(-15);
            make.height.mas_equalTo(@40);
        }];
        
        lastLabel=[UILabel new];
        [bgView addSubview:lastLabel];
        lastLabel.font=FONTSIZEMiddle;
        lastLabel.textColor=FONTColorLight;
        [lastLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakBgView).with.offset(70);
            make.left.equalTo(weakIV.mas_right).with.offset(8);
            make.right.equalTo(weakBgView).with.offset(-15);
            make.height.mas_equalTo(@13);
        }];
        
        showLabel=[UILabel new];
        showLabel.textColor=[UIColor whiteColor];
        [bgView addSubview:showLabel];
        showLabel.font=FONTSIZEBlodMiddle;
        showLabel.backgroundColor=FONTColorGreen;
        showLabel.textAlignment=NSTextAlignmentCenter;
        showLabel.layer.masksToBounds=YES;
        showLabel.layer.cornerRadius=4;
        showLabel.frame=CGRectMake(0, 10, 20, 18);
//        [showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(weakBgView).with.offset(10);
//            make.right.equalTo(weakBgView).with.offset(-15);
//             make.size.mas_equalTo(CGSizeMake(33, 18));
//        }];
        
        progressView=[UIProgressView new];
        [bgView addSubview:progressView];
        progressView.layer.masksToBounds=YES;
        progressView.layer.cornerRadius=5;
        progressView.tintColor=KKCOLORWITHBLUE;
        progressView.trackTintColor=[UIColor colorWithRed:0.12f green:0.13f blue:0.14f alpha:1.00f];
        [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(weakBgView).with.insets(UIEdgeInsetsMake(73, 170, 13, 60));
            
        }];
        [progressView setProgress:0.5f];
        
    }
    
    
    
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    CGSize size=[titleLabel.text sizeWithFont:titleLabel.font];
    

    float maxWidth=SCREEN_WIDTH-150+5;
    float width=size.width+5;
    if(width>maxWidth){
        
        width=maxWidth;
        
    }

    showLabel.center=CGPointMake(width+90+16, showLabel.center.y);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        
        bgView.backgroundColor=KKTableViewHightColor;
        
    }else{
        
        bgView.backgroundColor=KKTableViewCellColor;
    }
    
}

@end
