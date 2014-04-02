//
//  UIColor+MLUIKitAdditions.m
//  MLFramework
//
//  Created by Miguel Lara on 11/6/12.
//  Copyright (c) 2014 Miguel Lara. All rights reserved.
//

#import "UIColor+MLUIKitAdditions.h"

@implementation UIColor (MLUIKitAdditions)

// From: http://arstechnica.com/apple/2009/02/iphone-development-accessing-uicolor-components/
+ (UIColor *)ml_colorForRGBHex:(UInt32)hex
{
	int r = (hex >> 16) & 0xFF;
	int g = (hex >> 8) & 0xFF;
	int b = (hex) & 0xFF;
	
	return [UIColor colorWithRed:r / 255.0f
						   green:g / 255.0f
							blue:b / 255.0f
						   alpha:1.0f];
}

+ (UIColor *)ml_colorForRGBHexString:(NSString *)string
{
	NSScanner *scanner = [NSScanner scannerWithString:string];
	unsigned hexNum;
	if (![scanner scanHexInt:&hexNum])
	{
		return nil;
	}
	return [UIColor ml_colorForRGBHex:hexNum];
}

@end
