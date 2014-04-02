//
//  UIColor+MLUIKitAdditions.h
//  MLFramework
//
//  Created by Miguel Lara on 11/6/12.
//  Copyright (c) 2014 Miguel Lara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MLUIKitAdditions)

/*!
 @abstract Creates a \c UIColor instance with the RGB color values provided as an \c integer.
 
 @code
UIColor *red = [UIColor ml_colorForRGBHex:0xFF0000];
 @endcode
 
 @param hex	A hexadecimal number encoding the RGB values.
 @return A \c UIColor instance with the given RGB values.
 */
+ (UIColor *)ml_colorForRGBHex:(UInt32)hex;


/*!
 @abstract Creates a \c UIColor instance with the RGB color values provided as a \c string. You know designers love to give you hex values!
 
 @code
 UIColor *red = [UIColor ml_colorForHexString:@"FF0000"]
 @endcode
 
 @param stringToConvert	A hexadecimal number represented in a string, just as you would get on HTML or CSS.
 @return A \c UIColor instance with the given RGB values.
 */
+ (UIColor *)ml_colorForHexString:(NSString *)stringToConvert;

@end
