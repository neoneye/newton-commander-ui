//
// NCImageAndTextCell.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>
#import "NCListerCell.h"


@interface NCImageAndTextCell : NCListerCell {
@private
    NSImage* m_image2;

	float m_width_of_image_box;

}
@property float widthOfImageBox;

/*
NSCell already has a setImage, but we cannot use it.
In order to avoid name collision we use another name instead: setImage2
*/
- (void)setImage2:(NSImage *)anImage;
- (NSImage *)image2;


- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView;
- (NSSize)cellSize;

@end
