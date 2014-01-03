//
// NSView+SubviewExtensions.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>


@interface NSView (SubviewExtensions)

/*
add subview so it fits within the our frame
*/
-(void)addResizedSubview:(NSView*)aView;

/*
replace zero or more subviews with the provided view
*/
-(void)replaceSubviewsWithView:(NSView*)aView;

@end
