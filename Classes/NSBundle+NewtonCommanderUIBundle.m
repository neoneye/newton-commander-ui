//
// NSBundle+NewtonCommanderUIBundle.m
// NewtonCommander
//

#import "NSBundle+NewtonCommanderUIBundle.h"

@implementation NSBundle (NewtonCommanderUIBundle)

+(NSBundle*)newtonCommanderUIBundle {
	NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"NewtonCommanderUI.bundle"];
	NSAssert(bundlePath, @"must not be nil");
	NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
	NSAssert(bundle, @"must not be nil");
	return bundle;
}

@end
