//
//  UIView+MLUIKitAdditions.m
//  MLUIKitAdditions
//
//  Created by Miguel Lara on 15/06/14.
//  Copyright (c) 2014 Miguel Lara. All rights reserved.
//

#import "UIView+MLUIKitAdditions.h"

@implementation UIView (MLUIKitAdditions)

+ (instancetype)ml_viewFromDefaultNib
{
	NSString *name = NSStringFromClass(self);
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];
	UINib *nib = [UINib nibWithNibName:name	bundle:bundle];
	return [self ml_viewFromNib:nib];
}

+ (instancetype)ml_viewFromNib:(UINib *)nib
{
	UIView *view = nil;
	Class expectedClass = [self class];
	NSArray *nibObjects = [nib instantiateWithOwner:nil options:nil];
	for (id obj in nibObjects) {
		if ([obj isKindOfClass:expectedClass]) {
			view = obj;
			break;
		}
	}
	NSAssert(view, @"No view of class %@ in the nib %@", NSStringFromClass(expectedClass), nib);
	return view;
}

@end
