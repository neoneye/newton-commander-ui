//
// NCTableHeaderCell.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>


@interface NCTableHeaderCell : NSTextFieldCell {
	NSGradient* m_gradient;
	NSGradient* m_pressed_gradient;
	NSGradient* m_selected_gradient;
	NSGradient* m_selected_pressed_gradient;

	BOOL m_padding_cell;
	
	int m_sort_indicator;
}
@property(nonatomic, strong) NSGradient* gradient;
@property(nonatomic, strong) NSGradient* pressedGradient;
@property(nonatomic, strong) NSGradient* selectedGradient;
@property(nonatomic, strong) NSGradient* selectedPressedGradient;

// -1 = descending, 0 = none, 1 = ascending
@property(nonatomic) int sortIndicator;
@property(nonatomic) BOOL paddingCell;

@end
