//
//  SJClockView.h
//  StoryBoardGitDemo
//
//  Created by 沈骏 on 2018/5/22.
//  Copyright © 2018年 沈骏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJClockView : UIView

//------------------------------------------------------------------------------------//
//----- PROPERTIES -------------------------------------------------------------------//
//------------------------------------------------------------------------------------//

/// If set to YES, the graduation on the clock will be visible. See the methods bellow to costumize the graduations. Default value is YES.
@property (nonatomic) BOOL enableGraduations;

//----- CLOCK'S FACE CUSTOMIZATION -----//

/// The background color of the clock's face.
@property (strong, nonatomic) UIColor *faceBackgroundColor;

/// The alpha of the clock's face.
@property (nonatomic) CGFloat faceBackgroundAlpha;

/// The color of the clock's border.
@property (strong, nonatomic) UIColor *borderColor;

/// The alpha of the clock's border.
@property (nonatomic) CGFloat borderAlpha;

/// The width of the clock's border.
@property (nonatomic) CGFloat borderWidth;

@end
