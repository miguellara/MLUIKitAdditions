//
//  UIAlertView+MLUIKitAdditions.m
//  MLFramework
//
//  Created by Miguel Lara on 8/28/12.
//  Copyright (c) 2014 Miguel Lara. All rights reserved.
//

#import "UIAlertView+MLUIKitAdditions.h"
#import <objc/message.h>

static NSString const *kMLUIAlertViewDelegateKey = @"kMLUIAlertViewDelegateKey";


#pragma mark - MLUIAlertViewHelper

@interface MLUIAlertViewHelper : NSObject <UIAlertViewDelegate>
@property (copy, nonatomic) MLUIAlertViewBlock confirmBlock;
@property (copy, nonatomic) MLUIAlertViewBlock cancelBlock;
@end


@implementation MLUIAlertViewHelper

+ (MLUIAlertViewHelper *)delegateForAlertView:(UIAlertView *)alertView
							 withConfirmBlock:(MLUIAlertViewBlock)confirmBlock
								  cancelBlock:(MLUIAlertViewBlock)cancelBlock
{
	MLUIAlertViewHelper *delegate = [[self alloc] initWithConfirmBlock:confirmBlock
														   cancelBlock:cancelBlock];
	[delegate associateToAlertView:alertView];
	return delegate;
}

- (instancetype)initWithConfirmBlock:(MLUIAlertViewBlock)confirmBlock
			   cancelBlock:(MLUIAlertViewBlock)cancelBlock
{
	self = [super init];
	if (self)
	{
		_confirmBlock = [confirmBlock copy];
		_cancelBlock = [cancelBlock copy];
	}
	return self;
}

- (void)associateToAlertView:(UIAlertView *)alertView
{
	alertView.delegate = self;
	objc_setAssociatedObject(alertView, &kMLUIAlertViewDelegateKey, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)dieGracefullyWithAlertView:(UIAlertView *)alertView
{
	self.confirmBlock = nil;
	self.cancelBlock = nil;
	alertView.delegate = nil;
	objc_setAssociatedObject(alertView, &kMLUIAlertViewDelegateKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark UIAlertViewDelegate methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (alertView.cancelButtonIndex == buttonIndex)
	{
		if (self.cancelBlock)
		{
			self.cancelBlock(alertView);
		}
	}
	else
	{
		if (self.confirmBlock)
		{
			self.confirmBlock(alertView);
		}
	}
	[self dieGracefullyWithAlertView:alertView];
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
	if (self.cancelBlock)
	{
		self.cancelBlock(alertView);
	}
	[self dieGracefullyWithAlertView:alertView];
}

@end


#pragma mark - UIAlertView Category

@implementation UIAlertView (MLUIKitAdditions)

+ (UIAlertView *)ml_alertViewWithTitle:(NSString *)title
							   message:(NSString *)message
					confirmButtonTitle:(NSString *)confirmButtonTitle
					 cancelButtonTitle:(NSString *)cancelButtonTitle
						  confirmBlock:(MLUIAlertViewBlock)confirmBlock
						   cancelBlock:(MLUIAlertViewBlock)cancelBlock
{
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
														message:message
													   delegate:nil
											  cancelButtonTitle:cancelButtonTitle
											  otherButtonTitles:confirmButtonTitle, nil];
	
	[MLUIAlertViewHelper delegateForAlertView:alertView
							 withConfirmBlock:confirmBlock
								  cancelBlock:cancelBlock];

	return alertView;
}

@end
