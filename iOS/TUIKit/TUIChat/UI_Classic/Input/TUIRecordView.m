//
//  TRecordView.m
//  UIKit
//
//  Created by kennethmiao on 2018/10/9.
//  Copyright © 2018 Tencent. All rights reserved.
//

#import "TUIRecordView.h"
#import <TIMCommon/TIMDefine.h>

@implementation TUIRecordView
- (id)init {
    self = [super init];
    if (self) {
        [self setupViews];
        [self defaultLayout];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = [UIColor tui_colorWithHex:@"#07080F" alpha:0.7];

    _background = [[UIView alloc] init];
    _background.backgroundColor = Record_Background_Color;
    _background.layer.cornerRadius = 5;
    [_background.layer setMasksToBounds:YES];
    [self addSubview:_background];
    _background.hidden = YES;

    _recordImage = [[UIImageView alloc] init];
    _recordImage.image = [UIImage imageNamed:TUIChatImagePath(@"record_1")];
    _recordImage.alpha = 0.8;
    _recordImage.contentMode = UIViewContentModeCenter;
    _recordImage.hidden = YES;
    [self addSubview:_recordImage];

    _title = [[UILabel alloc] init];
    _title.font = [UIFont systemFontOfSize:14];
    _title.textColor = [UIColor tui_colorWithHex:@"#ffffff" alpha:1.0];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.layer.cornerRadius = 5;
    [_title.layer setMasksToBounds:YES];
    [self addSubview:_title];
    
    _secondBgView = [[UIView alloc] init];
    _secondBgView.backgroundColor = [UIColor tui_colorWithHex:@"#FFCC00"];
    _secondBgView.layer.cornerRadius = 10.0;
    _secondBgView.layer.masksToBounds = YES;
    [self addSubview:_secondBgView];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont systemFontOfSize:14];
    _timeLabel.textColor = [UIColor tui_colorWithHex:@"#000000" alpha:1.0];
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _timeLabel.text = @"60\"";
    [self addSubview:_timeLabel];
    
    _talkImageView = [[UIImageView alloc] init];
    _talkImageView.image = TUIChatBundleThemeImage(@"char_input_record_view_button_icon", @"char_input_record_view_button_icon");
    [self addSubview:_talkImageView];
    
    _cancelIconView = [[UIImageView alloc] init];
    _cancelIconView.image = TUIChatBundleThemeImage(@"char_input_record_view_cancel_icon", @"char_input_record_view_cancel_icon");
    [self addSubview:_cancelIconView];
}

- (void)defaultLayout {
    CGSize backSize = CGSizeMake(150, 150);
    _title.text = TIMCommonLocalizableString(TUIKitInputRecordSlideToCancel);
    CGSize titleSize = [_title sizeThatFits:CGSizeMake(Screen_Width, Screen_Height)];
    CGSize timeSize = CGSizeMake(100, 15);
    if (titleSize.width > backSize.width) {
        backSize.width = titleSize.width + 2 * Record_Margin;
    }
    CGFloat imageHeight = backSize.height - titleSize.height - 2 * Record_Margin;

    [self.talkImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-55.0));
        make.centerX.equalTo(self.mas_centerX);
        make.size.equalTo(@95.0);
    }];
    
    [self.timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.talkImageView.mas_top).offset(-30.5);
        make.centerX.equalTo(self.talkImageView.mas_centerX);
        make.height.equalTo(@20.0);
        make.width.equalTo(@100.0);
    }];
//    [self.recordImage mas_remakeConstraints:^(MASConstraintMaker *make) {
//      make.top.mas_equalTo(self.timeLabel.mas_bottom).mas_offset(-13);
//      make.centerX.mas_equalTo(self.background);
//      make.width.mas_equalTo(backSize.width);
//      make.height.mas_equalTo(imageHeight);
//    }];
    [self.title mas_remakeConstraints:^(MASConstraintMaker *make) {
      make.centerX.mas_equalTo(self.talkImageView.mas_centerX);
      make.bottom.mas_equalTo(self.talkImageView.mas_top).offset(-96.0);
      make.width.mas_equalTo(backSize.width);
      make.height.mas_equalTo(15);
    }];
    [self.secondBgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.timeLabel.mas_centerX);
        make.centerY.equalTo(self.timeLabel.mas_centerY);
        make.width.equalTo(@110.0);
        make.height.equalTo(@39.0);
    }];
//    [self.background mas_remakeConstraints:^(MASConstraintMaker *make) {
//      make.top.mas_equalTo(self.timeLabel.mas_top).mas_offset(-3);
//      make.bottom.mas_equalTo(self.title.mas_bottom).mas_offset(3);
//      make.center.mas_equalTo(self);
//      make.width.mas_equalTo(backSize.width);
//    }];
    [self.cancelIconView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.timeLabel.mas_centerX);
        make.bottom.equalTo(self.title.mas_top).offset(-15.0);
        make.size.equalTo(@40.0);
    }];
}

- (void)setStatus:(RecordStatus)status {
    switch (status) {
        case Record_Status_Recording: {
            _title.text = TIMCommonLocalizableString(TUIKitInputRecordSlideToCancel);
            _title.backgroundColor = [UIColor clearColor];
            _cancelIconView.transform = CGAffineTransformIdentity;
            _cancelIconView.alpha = 0.5;
            break;
        }
        case Record_Status_Cancel: {
            _title.text = TIMCommonLocalizableString(TUIKitInputRecordReleaseToCancel);
            _title.backgroundColor = [UIColor clearColor];
            _cancelIconView.transform = CGAffineTransformMakeScale(1.2, 1.2);
            _cancelIconView.alpha = 1.0;
            break;
        }
        case Record_Status_TooShort: {
            _title.text = TIMCommonLocalizableString(TUIKitInputRecordTimeshort);
            _title.backgroundColor = [UIColor clearColor];
            _cancelIconView.transform = CGAffineTransformMakeScale(1.2, 1.2);
            _cancelIconView.alpha = 1.0;
            break;
        }
        case Record_Status_TooLong: {
            _title.text = TIMCommonLocalizableString(TUIKitInputRecordTimeLong);
            _title.backgroundColor = [UIColor clearColor];
            _cancelIconView.transform = CGAffineTransformIdentity;
            _cancelIconView.alpha = 1.0;
            break;
        }
        default:
            break;
    }
}

- (void)setPower:(NSInteger)power {
    NSString *imageName = [self getRecordImage:power];
    _recordImage.image = [UIImage imageNamed:TUIChatImagePath(imageName)];
}

- (NSString *)getRecordImage:(NSInteger)power {
    power = power + 60;
    int index = 0;
    if (power < 25) {
        index = 1;
    } else {
        index = ceil((power - 25) / 5.0) + 1;
    }
    index = MIN(index, 8);
    return [NSString stringWithFormat:@"record_%d", index];
}

@end
