/*
IDEA: rename from NCMakeDirController to NCCreateItemSheet, where item can be: dir, file, link, file from template
IDEA: merge with NCMakeFileController
IDEA: merge with NCMakeLinkController
*/
//
// NCMakeDirController.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>


@interface NCMakeDirController : NSWindowController {
	id __unsafe_unretained m_delegate;
	IBOutlet NSTextField* m_textfield;
	NSString* m_working_dir;
	NSString* m_suggest_name;          
}
@property (unsafe_unretained) IBOutlet id delegate;
@property(nonatomic, strong) NSString* suggestName;
@property(nonatomic, strong) NSString* workingDir;
+(NCMakeDirController*)shared;

-(void)beginSheetForWindow:(NSWindow*)parentWindow;

-(IBAction)cancelAction:(id)sender;
-(IBAction)submitAction:(id)sender;
-(IBAction)textAction:(id)sender;

@end

@interface NSObject (NCMakeDirControllerDelegate)
-(void)makeDirController:(NCMakeDirController*)ctrl didMakeDir:(NSString*)path;
@end