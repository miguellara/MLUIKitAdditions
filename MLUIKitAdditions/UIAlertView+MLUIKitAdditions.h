//
//  UIAlertView+MLUIKitAdditions.h
//  MLFramework
//
//  Created by Miguel Lara on 8/28/12.
//  Copyright (c) 2014 Miguel Lara. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MLUIAlertViewBlock)(UIAlertView *alertView);


@interface UIAlertView (MLUIKitAdditions)

/*!
 @abstract Creates an alert view using convenient blocks for the confirmation and cancellation actions.
 
 @code
[[UIAlertView
  ml_alertViewWithTitle:@"Are you sure?"
  message:@"Something will happen if you continue"
  confirmButton:@"Continue"
  cancelButton:@"Never mind"
  confirmBlock:^{
	// Do something...
  }
  cancelBlock:^{
	// Cancel it...
  }] show];
 @endcode
 
 @param title				The title of the alert view.
 @param message				The text message in the alert view.
 @param	confirmButtonTitle	The title of the confirmation button in the alert view. Can be nil if there is no confirmation button.
 @param cancelButtonTitle	The title of the cancel button in the alert view. Can be nil if there is no cancel button.
 @param confirmBlock		The block for the confirmation action. Ignored if \c nil.
  @param cancelBlock		The block for the cancel action. Ignored if \c nil.
 
 @return The new alert view that can be shown.
 */
+ (UIAlertView *)ml_alertViewWithTitle:(NSString *)title
							   message:(NSString *)message
					confirmButtonTitle:(NSString *)confirmButtonTitle
					 cancelButtonTitle:(NSString *)cancelButtonTitle
						  confirmBlock:(MLUIAlertViewBlock)confirmBlock
						   cancelBlock:(MLUIAlertViewBlock)cancelBlock;

@end
