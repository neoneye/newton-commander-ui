//
// NCPermissionSheet.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>


@interface NCPermissionSheet : NSWindowController {

}
+(NCPermissionSheet*)shared;

-(void)beginSheetForWindow:(NSWindow*)window;

-(IBAction)cancelAction:(id)sender;
-(IBAction)submitAction:(id)sender;

@end

@interface NSObject (NCPermissionSheetDelegate)

@end
