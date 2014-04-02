//
//  UIActionSheet+MLUIKitAdditions.m
//  MLFramework
//
//  Created by Miguel Lara on 8/27/12.
//  Copyright (c) 2014 Miguel Lara. All rights reserved.
//

#import "UIActionSheet+MLUIKitAdditions.h"
#import <objc/message.h>

static NSString const *kMLUIActionSheetDelegateKey = @"kMLUIActionSheetDelegateKey";


#pragma mark - MLUIActionSheetHelper

@interface _MLUIActionSheetHelper : NSObject <UIActionSheetDelegate>
@property (copy, nonatomic) MLActionSheetDestructiveBlock destructiveBlock;
@property (copy, nonatomic) MLActionSheetDismissBlock dismissBlock;
@property (copy, nonatomic) MLActionSheetCancelBlock cancelBlock;
@end


@implementation _MLUIActionSheetHelper

+ (_MLUIActionSheetHelper *)delegateForActionSheet:(UIActionSheet *)actionSheet
							  withDestructiveBlock:(MLActionSheetDestructiveBlock)destructiveBlock
									  dismissBlock:(MLActionSheetDismissBlock)dismissBlock
									   cancelBlock:(MLActionSheetCancelBlock)cancelBlock
{
	_MLUIActionSheetHelper *delegate = [[self alloc] initWithDestructiveBlock:destructiveBlock
																 dismissBlock:dismissBlock
																  cancelBlock:cancelBlock];
	[delegate associateToActionSheet:actionSheet];
	return delegate;
}

- (instancetype)initWithDestructiveBlock:(MLActionSheetDestructiveBlock)destructiveBlock
							dismissBlock:(MLActionSheetDismissBlock)dismissBlock
							 cancelBlock:(MLActionSheetCancelBlock)cancelBlock
{
    self = [super init];
    if (self)
	{
		_destructiveBlock = [destructiveBlock copy];
		_dismissBlock = [dismissBlock copy];
		_cancelBlock = [cancelBlock copy];
	}
	return self;
}

- (void)associateToActionSheet:(UIActionSheet *)actionSheet
{
	actionSheet.delegate = self;
	objc_setAssociatedObject(actionSheet, &kMLUIActionSheetDelegateKey, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)dieGracefullyWithActionSheet:(UIActionSheet *)actionSheet
{
	self.destructiveBlock = nil;
	self.dismissBlock = nil;
	self.cancelBlock = nil;
	actionSheet.delegate = nil;
	objc_setAssociatedObject(actionSheet, &kMLUIActionSheetDelegateKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark UIActionSheetDelegate methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (actionSheet.cancelButtonIndex == buttonIndex)
	{
		if (self.cancelBlock)
		{
			self.cancelBlock(actionSheet);
		}
	}
	else if (actionSheet.destructiveButtonIndex == buttonIndex)
	{
		if (self.destructiveBlock)
		{
			self.destructiveBlock(actionSheet);
		}
	}
	else
	{
		if (self.dismissBlock)
		{
			self.dismissBlock(actionSheet, buttonIndex);
		}
	}
	[self dieGracefullyWithActionSheet:actionSheet];
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
	if (self.cancelBlock)
	{
		self.cancelBlock(actionSheet);
	}
	[self dieGracefullyWithActionSheet:actionSheet];
}

@end


#pragma mark - UIActionSheet Category

@implementation UIActionSheet (MLUIKitAdditions)

+ (UIActionSheet *)ml_actionSheetWithTitle:(NSString *)title
									 style:(UIActionSheetStyle)style
					destructiveButtonTitle:(NSString *)destructiveButtonTitle
						 otherButtonTitles:(NSArray *)otherButtonTitles
						 cancelButtonTitle:(NSString *)cancelButtonTitle
						  destructiveBlock:(MLActionSheetDestructiveBlock)destructiveBlock
							  dismissBlock:(MLActionSheetDismissBlock)dismissBlock
							   cancelBlock:(MLActionSheetCancelBlock)cancelBlock

{
	UIActionSheet *actionSheet = [[UIActionSheet alloc] init];
	actionSheet.title = title;
	actionSheet.actionSheetStyle = style;
	
	[_MLUIActionSheetHelper delegateForActionSheet:actionSheet
							  withDestructiveBlock:destructiveBlock
									  dismissBlock:dismissBlock
									   cancelBlock:cancelBlock];
	
	// Sets up the buttons in order
	NSUInteger ix = 0;
	
	// Destructive button
	if (destructiveButtonTitle != nil)
	{
		[actionSheet addButtonWithTitle:destructiveButtonTitle];
		actionSheet.destructiveButtonIndex = ix;
		ix++;
	}
	
	// Other buttons
	for (NSString *buttonTitle in otherButtonTitles)
	{
		[actionSheet addButtonWithTitle:buttonTitle];
	}
	ix += otherButtonTitles.count;
	
	// Cancel button
	if (cancelButtonTitle != nil)
	{
		[actionSheet addButtonWithTitle:cancelButtonTitle];
		actionSheet.cancelButtonIndex = ix;
		ix++;
	}
	
	return actionSheet;
}

@end
