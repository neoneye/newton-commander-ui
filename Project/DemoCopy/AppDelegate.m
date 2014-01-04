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
	id <NCCopyOperationProtocol> copyOperation = [dsa copyOperation];
	
	NSArray *names = @[@"copy1.txt"];
	
	NSString* sourceDir = [@"~/Desktop" stringByExpandingTildeInPath];
	NSString* targetDir = [@"~/Downloads" stringByExpandingTildeInPath];
	
	
	NCCopySheet* sheet = [NCCopySheet shared];
	[sheet setSourceDir:sourceDir];
	[sheet setTargetDir:targetDir];
	[sheet setNames:names];
	[sheet setCopyOperation:copyOperation];
	[sheet setDelegate:self];
	[sheet beginSheetForWindow:[self window]];
}

-(void)copySheetDidClose:(NCCopySheet*)sheet {
	NSLog(@"copy sheet did close");
	exit(EXIT_SUCCESS);
}

-(void)copySheetDidFinish:(NCCopySheet*)sheet {
	NSLog(@"copy sheet did finish");
	exit(EXIT_SUCCESS);
}

@end
