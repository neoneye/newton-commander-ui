//
// NCMoveSheet.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>
#import "NCMoveOperationProtocol.h"


@class NCPathControl;

@interface NCMoveSheet : NSWindowController {
	NSView* __weak m_confirm_view;
	NSView* __weak m_progress_view;

	NSArray* m_names;
	NSString* m_source_dir;
	NSString* m_target_dir;

	// confirm sheet
	NSTextField* __weak m_confirm_summary;
	NSButton* __weak m_confirm_button;
	NSButton* __weak m_confirm_close_when_finished_button;
	NCPathControl* __weak m_confirm_source_path;
	NCPathControl* __weak m_confirm_target_path;

	// progress sheet
	NSTextField* __weak m_progress_summary;
	NSProgressIndicator* __weak m_progress_indicator;
	NSButton* __weak m_abort_button;
	NSButton* __weak m_progress_close_when_finished_button;
	NCPathControl* __weak m_progress_source_path;
	NCPathControl* __weak m_progress_target_path;

	NSArrayController* __weak m_progress_items;
}
@property (weak) IBOutlet NSView* confirmView;
@property (weak) IBOutlet NSView* progressView;
@property (weak) IBOutlet NSTextField* confirmSummary;
@property (weak) IBOutlet NSButton* confirmButton;
@property (weak) IBOutlet NSButton* abortButton;
@property (weak) IBOutlet NSButton* confirmCloseWhenFinishedButton;
@property (weak) IBOutlet NSButton* progressCloseWhenFinishedButton;
@property (weak) IBOutlet NSTextField* progressSummary;
@property (weak) IBOutlet NSProgressIndicator* progressIndicator;
@property (weak) IBOutlet NSArrayController* progressItems;
@property (weak) IBOutlet NCPathControl* confirmSourcePath;
@property (weak) IBOutlet NCPathControl* confirmTargetPath;
@property (weak) IBOutlet NCPathControl* progressSourcePath;
@property (weak) IBOutlet NCPathControl* progressTargetPath;
@property (copy) NSArray* names;
@property (copy) NSString* sourceDir;
@property (copy) NSString* targetDir;

+(void)beginSheetForWindow:(NSWindow*)parentWindow
				 operation:(id <NCMoveOperationProtocol>)operation
				 sourceDir:(NSString*)sourceDir
				 targetDir:(NSString*)targetDir
					 names:(NSArray*)names
		 completionHandler:(void (^)())handler;


-(IBAction)cancelAction:(id)sender;
-(IBAction)submitAction:(id)sender;


@end
