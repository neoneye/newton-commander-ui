//
// NCPreferencesAdvancedController.m
// Newton Commander
//
#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif


#import "NCPreferencesAdvancedController.h"


@implementation NCPreferencesAdvancedController

- (NSString *)title
{
	return NSLocalizedString(@"Advanced", @"Title of 'Advanced' preference pane");
}

- (NSString *)identifier
{
	return @"AdvancedPane";
}

- (NSImage *)image
{
	return [NSImage imageNamed:@"NSPreferencesGeneral"];
}

@end
