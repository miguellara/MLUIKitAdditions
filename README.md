MLUIKitAdditions
================

Lite framework with some helpful categories over UIKit classes.



## UIActionSheet+MLUIKitAdditions

### +ml_actionSheetWithTitle:‍style:‍destructiveButtonTitle:‍otherButtonTitles:‍cancelButtonTitle:‍destructiveBlock:‍dismissBlock:‍cancelBlock:‍
Creates an alert view using convenient blocks for the confirmation and cancellation actions.

Example:

```
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
```

#### Declaration
```
+ (UIActionSheet *)ml_actionSheetWithTitle:(NSString *)title
									 style:(UIActionSheetStyle)style
					destructiveButtonTitle:(NSString *)destructiveButtonTitle
						 otherButtonTitles:(NSArray *)otherButtonTitles
						 cancelButtonTitle:(NSString *)cancelButtonTitle
						  destructiveBlock:(MLActionSheetDestructiveBlock)destructiveBlock
							  dismissBlock:(MLActionSheetDismissBlock)dismissBlock
							   cancelBlock:(MLActionSheetCancelBlock)cancelBlock
```

#### Parameters
##### title
The title of the action sheet.

##### style
See `UIActionSheetStyle` for more details.

##### destructiveButtonTitle
The tirle of the destructive button. Can be `nil` if there is no cancel button.

##### confirmButtonTitle
The title of the confirmation button. Can be `nil` if there is no confirmation button.

##### cancelButtonTitle
The title of the cancel button. Can be `nil` if there is no cancel button.

##### destructiveBlock
The block for the destructive action. Ignored if `nil`.

##### dismissBlock
The block to be executed when a button other than the destructive or cancel ones is tapped. Ignored if `nil`.

- cancelBlock
The block for the cancel action. Ignored if `nil`.

#### Return
The new alert view that can be shown.


## UIAlertView+MLUIKitAdditions

### +ml_alertViewWithTitle:message:confirmButtonTitle:cancelButtonTitle:confirmBlock:cancelBlock:
Creates an alert view using convenient blocks for the confirmation and cancellation actions.

Example:

```
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
```
#### Declaration
```
+ (UIAlertView *)ml_alertViewWithTitle:(NSString *)title
							   message:(NSString *)message
					confirmButtonTitle:(NSString *)confirmButtonTitle
					 cancelButtonTitle:(NSString *)cancelButtonTitle
						  confirmBlock:(MLUIAlertViewBlock)confirmBlock
						   cancelBlock:(MLUIAlertViewBlock)cancelBlock
```

#### Parameters
##### title
The title of the alert view.

##### message
The text message in the alert view.

##### confirmButtonTitle
The title of the confirmation button in the alert view. Can be nil if there is no confirmation button.

##### cancelButtonTitle
The title of the cancel button in the alert view. Can be nil if there is no cancel button.

##### confirmBlock
The block for the confirmation action. Ignored if `nil`.

##### cancelBlock
The block for the cancel action. Ignored if `nil`.

#### Return Value
The new alert view that can be shown.


## UIColor+MLUIKitAdditions


### +ml_colorForRGBHex:
Creates a `UIColor` instance with the RGB color values provided as an `integer`.

Example:

```
UIColor *red = [UIColor ml_colorForRGBHex:0xFF0000];
```

#### Declaration
```
+ (UIColor *)ml_colorForRGBHex:(UInt32)hex
```

#### Parameters
##### hex
A hexadecimal number encoding the RGB values.

#### Return Value
A `UIColor` instance with the given RGB values.


### +ml_colorForRGBHexString:
Creates a `UIColor` instance with the RGB color values provided as a `string`. You know designers love to give you hex values!

Example:

```
UIColor *red = [UIColor ml_colorForRGBHexString:@"FF0000"];
```

#### Declaration
```
+ (UIColor *)ml_colorForRGBHexString:(NSString *)string
```

#### Parameters
##### string
A hexadecimal number represented in a string, just as you would get on HTML or CSS.

#### Return Value
A `UIColor` instance with the given RGB values.