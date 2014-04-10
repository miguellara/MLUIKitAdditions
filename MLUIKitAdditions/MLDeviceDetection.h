//
//  MLDeviceDetection.h
//  MLUIKitAdditions
//
//  Created by Miguel Lara on 10/04/14.
//  Copyright (c) 2014 Miguel Lara. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_INLINE BOOL MLDeviceIsIPad()
{
	return  [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
}

NS_INLINE BOOL MLDeviceIsIPhone()
{
	return  [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
}

NS_INLINE BOOL MLDeviceIsFourInchDisplay()
{
	CGSize screenSize = [UIScreen mainScreen].bounds.size;
	return MAX(screenSize.height, screenSize.width) > 480.0f;
}

// Recommended check in:
// https://developer.apple.com/library/prerelease/ios/documentation/UserExperience/Conceptual/TransitionGuide/SupportingEarlieriOS.html#//apple_ref/doc/uid/TP40013174-CH14-SW1
NS_INLINE NSInteger MLDeviceSystemMajorVersion()
{
	return [[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."][0] intValue];
}

NS_INLINE BOOL MLOSIsBeforeIOS7()
{
	return MLDeviceSystemMajorVersion() < 7;
}

NS_INLINE BOOL MLOSIsIOS7OrLater()
{
	return MLDeviceSystemMajorVersion() >= 7;
}
