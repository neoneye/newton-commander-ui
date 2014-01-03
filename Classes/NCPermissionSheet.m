//
// NCPermissionSheet.m
// Newton Commander
//
#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif


#import "NCPermissionSheet.h"
#import "NSBundle+NewtonCommanderUIBundle.h"


@implementation NCPermissionSheet

+(NCPermissionSheet*)shared {
    static NCPermissionSheet* shared = nil;
    if(!shared) {
        shared = [[NCPermissionSheet allocWithZone:NULL] init];
    }
    return shared;
}

- (id)init {
	NSBundle *bundle = [NSBundle newtonCommanderUIBundle];
	NSString *path = [bundle pathForResource:@"PermissionSheet" ofType:@"nib"];
	NSAssert(path, @"nib is not found in the framework bundle");
    self = [super initWithWindowNibPath:path owner:self];
    return self;
}

-(void)beginSheetForWindow:(NSWindow*)parentWindow {
	/*
	Wait until we are 100% sure that the nib has been fully loaded
	ensure that the window is loaded before we start operating
	on the views. [self window] invokes loadWindow internally.
	This method will wait until the load is completed.
	
	For more info, see
	NSWindowController - (NSWindow *)window
	*/
	NSWindow* window = [self window];
	NSAssert(window, @"loadWindow is supposed to init the window");

    [NSApp 
		beginSheet: window
        modalForWindow: parentWindow
		modalDelegate: self
		didEndSelector: nil //@selector(didEndSheet:returnCode:contextInfo:)
		contextInfo: nil
	];
}

-(IBAction)cancelAction:(id)sender {
	[[self window] close];
	[NSApp endSheet:[self window] returnCode:0];
}

-(IBAction)submitAction:(id)sender {
	BOOL close_sheet = YES;
/*	NSString* path = [m_textfield stringValue];

	if([m_delegate respondsToSelector:@selector(makeGotoFolderController:gotoFolder:)]) {
		close_sheet = [m_delegate makeGotoFolderController:self gotoFolder:path];
	}*/

	if(close_sheet) {
		[[self window] close];
		[NSApp endSheet:[self window] returnCode:0];
	}
}

@end
