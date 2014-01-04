//
// AppDelegate.m
// Newton Commander
//

#import "AppDelegate.h"
#import "NCMoveSheet.h"
#import "NCListerDataSourceAdvanced.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	NCListerDataSourceAdvanced *dsa = [NCListerDataSourceAdvanced new];
	id <NCMoveOperationProtocol> moveOperation = [dsa moveOperation];
	
	NSArray *names = @[@"move1.txt"];
	
	NSString* sourceDir = [@"~/Desktop" stringByExpandingTildeInPath];
	NSString* targetDir = [@"~/Downloads" stringByExpandingTildeInPath];
	
	
	NCMoveSheet* sheet = [NCMoveSheet shared];
	[sheet setSourceDir:sourceDir];
	[sheet setTargetDir:targetDir];
	[sheet setNames:names];
	[sheet setMoveOperation:moveOperation];
	[sheet setDelegate:self];
	[sheet beginSheetForWindow:[self window]];
	
}

@end
