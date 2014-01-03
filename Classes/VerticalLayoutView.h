//
// VerticalLayoutView.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>

#define kVerticalLayoutViewCapacity 10

@interface VerticalLayoutView : NSView {
@private
	float m_height_array[kVerticalLayoutViewCapacity];
	NSView* m_flexible_view;
}

-(void)setHeight:(float)value forIndex:(NSInteger)index;
-(float)heightForIndex:(NSInteger)index;
-(void)setFlexibleView:(NSView*)view;

@end
