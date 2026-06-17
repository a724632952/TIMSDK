//
//  ThemeCustomConfig.h
//  TUIChat
//
//  Created by WeasonLi on 2026/6/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThemeCustomConfig : NSObject

/// Shared theme customization configuration for TUIChat.
+ (instancetype)sharedConfig;

/// The text color used by voice message-related labels.
@property (nonatomic, strong, nullable) UIColor *voiceMessageTextColor;
/// The tint color used by voice message icons or images.
@property (nonatomic, strong, nullable) UIColor *voiceMessageImageColor;

/// The mic button image shown on the input bar.
@property (nonatomic, strong, nullable) UIImage *inputBarMicImage;
/// The disabled send button image shown on the input bar.
@property (nonatomic, strong, nullable) UIImage *inputBarSendDisableImage;
/// The enabled send button image shown on the input bar.
@property (nonatomic, strong, nullable) UIImage *inputBarSendEnableImage;
/// The background color of the input bar container.
@property (nonatomic, strong, nullable) UIColor *inputBarBackgroundColor;
/// The shadow color of the input bar container.
@property (nonatomic, strong, nullable) UIColor *inputBarShadowColor;
/// The placeholder text color inside the input bar text field.
@property (nonatomic, strong, nullable) UIColor *inputBarPlaceholderTextColor;
/// The text color inside the input bar text field.
@property (nonatomic, strong, nullable) UIColor *inputBarTextColor;
/// The image used for the picture send button on the input bar.
@property (nonatomic, strong, nullable) UIImage *inputBarImageSendButtonImage;
/// The background color of the text input area on the input bar.
@property (nonatomic, strong, nullable) UIColor *inputBarInputBackgroundColor;
/// The image used when switching between voice and text mode.
@property (nonatomic, strong, nullable) UIImage *inputBarToggleTextModeImage;

/// The background color used by the long-press record panel.
@property (nonatomic, strong, nullable) UIColor *longPressRecordBackgroundColor;
/// The text color used by the long-press record panel.
@property (nonatomic, strong, nullable) UIColor *longPressRecordTextColor;

@property (nonatomic, strong, nullable) UIColor *incomeBubbleColor;

@property (nonatomic, strong, nullable) UIImage *incomeBubbleImage;

@property (nonatomic, strong, nullable) UIImage *outgoingBubbleImage;

@property (nonatomic, strong, nullable) UIImage *keyboardTypeImage;

@property (nonatomic, strong, nullable) UIImage *selectButtonImage;

/// Voice Message
/// The image used by voice message cells.
@property (nonatomic, strong, nullable) UIImage *voiceMessageIncomeImage;
@property (nonatomic, strong, nullable) UIImage *voiceMessageOutgoingImage;

/// The image used by voice message cells.
@property (nonatomic, strong, nullable) UIImage *voiceMessageIncomePlayingImage1;
@property (nonatomic, strong, nullable) UIImage *voiceMessageIncomePlayingImage2;
@property (nonatomic, strong, nullable) UIImage *voiceMessageIncomePlayingImage3;

@property (nonatomic, strong, nullable) UIImage *voiceMessageOutgoingPlayingImage1;
@property (nonatomic, strong, nullable) UIImage *voiceMessageOutgoingPlayingImage2;
@property (nonatomic, strong, nullable) UIImage *voiceMessageOutgoingPlayingImage3;

/// Text Message
@property (nonatomic, strong, nullable) UIColor *textMessageTextColor;

///Normal

@property (nonatomic, strong, nullable) UIColor *primary;
@property (nonatomic, strong, nullable) UIColor *secondary;
@property (nonatomic, strong, nullable) UIColor *tertiary;
@property (nonatomic, strong, nullable) UIColor *primaryOnLight;
@property (nonatomic, strong, nullable) UIColor *secondaryOnLight;
@property (nonatomic, strong, nullable) UIColor *tertiaryOnLight;

@end

NS_ASSUME_NONNULL_END
