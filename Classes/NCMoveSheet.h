//
// NCMoveSheet.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>
#import "NCMoveOperationProtocol.h"

@interface NCMoveSheet : NSWindowController

/**
 Opens the "move files" modal sheet
 
 @param parentWindow        The window to which the sheet should attach itself.
 @param operation           The worker that should carry out the actual move operaion.
 @param sourceDir           The folder where the names should be moved from.
 @param targetDir           The folder where the names should be moved into.
 @param names               Array of NSStrings with file/folder names to be moved.
 @param completionHandler   The completion handler that gets called when the sheet's modal session ends.
 */
+(void)beginSheetForWindow:(NSWindow*)parentWindow
				 operation:(id <NCMoveOperationProtocol>)operation
				 sourceDir:(NSString*)sourceDir
				 targetDir:(NSString*)targetDir
					 names:(NSArray*)names
		 completionHandler:(void (^)())handler;

@end
