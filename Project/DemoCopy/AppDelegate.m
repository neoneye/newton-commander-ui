//
// AppDelegate.m
// Newton Commander
//

#import "AppDelegate.h"
#import "NCCopySheet.h"
#import "NCListerDataSourceAdvanced.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	NCListerDataSourceAdvanced *dsa = [NCListerDataSourceAdvanced new];
	id <NCCopyOperationProtocol> operation = [dsa copyOperation];
	
	NSArray *names = @[@"copy1.txt"];
	
	NSString* sourceDir = [@"~/Desktop" stringByExpandingTildeInPath];
	NSString* targetDir = [@"~/Downloads" stringByExpandingTildeInPath];
	

	[NCCopySheet beginSheetForWindow:self.window
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
