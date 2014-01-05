//
// NCCopySheet.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>
#import "NCCopyOperationProtocol.h"

@interface NCCopySheet : NSWindowController

/**
 Opens the "copy files" modal sheet
 
 @param parentWindow        The window to which the sheet should attach itself.
 @param operation           The worker that should carry out the actual copy operaion.
 @param sourceDir           The folder where the names should be copied from.
 @param targetDir           The folder where the names should be copied into.
 @param names               Array of NSStrings with file/folder names to be copied.
 @param completionHandler   The completion handler that gets called when the sheet's modal session ends.
 */
+(void)beginSheetForWindow:(NSWindow*)parentWindow
				 operation:(id <NCCopyOperationProtocol>)operation
				 sourceDir:(NSString*)sourceDir
				 targetDir:(NSString*)targetDir
					 names:(NSArray*)names
		 completionHandler:(void (^)())handler;

@end
