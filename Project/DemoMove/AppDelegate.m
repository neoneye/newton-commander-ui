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
	id <NCMoveOperationProtocol> operation = [dsa moveOperation];
	
	NSArray *names = @[@"move1.txt"];
	
	NSString* sourceDir = [@"~/Desktop" stringByExpandingTildeInPath];
	NSString* targetDir = [@"~/Downloads" stringByExpandingTildeInPath];
	
	
	[NCMoveSheet beginSheetForWindow:self.window
						   operation:operation
						   sourceDir:sourceDir
						   targetDir:targetDir
							   names:names
				   completionHandler:
	 ^{
		 NSLog(@"completionHandler");
		 exit(EXIT_SUCCESS);
	 }];
}

@end
