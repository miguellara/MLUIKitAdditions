//
//  UIActionSheet+MLUIKitAdditions.h
//  MLFramework
//
//  Created by Miguel Lara on 8/27/12.
//  Copyright (c) 2014 Miguel Lara. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MLActionSheetDestructiveBlock)(UIActionSheet *actionSheet);
typedef void(^MLActionSheetDismissBlock)(UIActionSheet *actionSheet, NSInteger buttonIx);
typedef void(^MLActionSheetCancelBlock)(UIActionSheet *actionSheet);


@interface UIActionSheet (MLUIKitAdditions)

/*!
 @abstract Creates an alert view using convenient blocks for the confirmation and cancellation actions.
 
 @code
[[UIActionSheet
  ml_actionSheetWithTitle:@"Do something!"
  style:UIActionSheetStyleDefault
  destructiveButtonTitle:@"Destroy!"
  otherButtonTitles:@[@"Button Zero", @"Button One"]
  cancelButtonTitle:@"Cancel"
  destructiveBlock:^(UIActionSheet *actionSheet) {
	// Do something destructive...
  }
  dismissBlock:^(UIActionSheet *actionSheet, NSInteger buttonIx) {
	switch (buttonIx)
	{
		case 0: 
			// Action for button Zero
			break;
		case 1:
			// Action for button One
			break;
	}
  }
  cancelBlock:^(UIActionSheet *actionSheet) {
	// Do something on the cancel...
  }] showInView:view];
 @endcode
 
 @param title					The title of the action sheet.
 @param style					See \c UIActionSheetStyle for more details.
 @param destructiveButtonTitle	The tirle of the destructive button. Can be nil if there is no cancel button.
 @param	confirmButtonTitle		The title of the confirmation button. Can be nil if there is no confirmation button.
 @param cancelButtonTitle		The title of the cancel button. Can be nil if there is no cancel button.
 @param destructiveBlock		The block for the destructive action. Ignored if \c nil.
 @param dismissBlock			The block to be executed when a button other than the destructive or cancel ones is tapped. Ignored if \c nil.
 @param cancelBlock				The block for the cancel action. Ignored if \c nil.
 
 @return The new alert view that can be shown.
 */
+ (UIActionSheet *)ml_actionSheetWithTitle:(NSString *)title
									 style:(UIActionSheetStyle)style
					destructiveButtonTitle:(NSString *)destructiveButtonTitle
						 otherButtonTitles:(NSArray *)otherButtonTitles
						 cancelButtonTitle:(NSString *)cancelButtonTitle
						  destructiveBlock:(MLActionSheetDestructiveBlock)destructiveBlock
							  dismissBlock:(MLActionSheetDismissBlock)dismissBlock
							   cancelBlock:(MLActionSheetCancelBlock)cancelBlock;

@end
