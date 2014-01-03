/*
IDEA: rename from NCMakeLinkController to NCCreateItemSheet, where item can be: dir, file, link, file from template
IDEA: merge with NCMakeDirController
IDEA: merge with NCMakeFileController
*/
//
// NCMakeLinkController.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>


@interface NCMakeLinkController : NSWindowController {
	id __unsafe_unretained m_delegate;
	IBOutlet NSTextField* m_link_name_textfield;                         
	IBOutlet NSTextField* m_link_target_textfield;
	NSString* m_working_dir;          
	NSString* m_link_name;          
	NSString* m_link_target;          
}
@property (unsafe_unretained) IBOutlet id delegate;
@property(nonatomic, strong) NSString* workingDir;
@property(nonatomic, strong) NSString* linkName;
@property(nonatomic, strong) NSString* linkTarget;
+(NCMakeLinkController*)shared;

-(void)beginSheetForWindow:(NSWindow*)parentWindow;

-(IBAction)cancelAction:(id)sender;
-(IBAction)submitAction:(id)sender;
-(IBAction)textAction:(id)sender;

@end

@interface NSObject (NCMakeLinkControllerDelegate)
-(void)makeLinkController:(NCMakeLinkController*)ctrl didMakeLink:(NSString*)path;
@end