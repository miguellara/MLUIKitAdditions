//
//  UIView+MLUIKitAdditions.h
//  MLUIKitAdditions
//
//  Created by Miguel Lara on 15/06/14.
//  Copyright (c) 2014 Miguel Lara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MLUIKitAdditions)

/*!
 @abstract	Instantiates the first object of this \c UIView subclass in the default nib.
			The default nob is the one with the class name in this class' bundle.
 @see + (instancetype)ml_viewFromNib:(UINib *)nib
 */
+ (instancetype)ml_viewFromDefaultNib;

/*!
 @abstract Instantiates the first object of this \c UIView subclass in the given nib.
 */
+ (instancetype)ml_viewFromNib:(UINib *)nib;

@end
