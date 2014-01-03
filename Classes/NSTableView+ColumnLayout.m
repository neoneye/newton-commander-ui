//
// NSTableView+ColumnLayout.m
// Newton Commander
//
#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif


#import "NSTableView+ColumnLayout.h"


@implementation NSTableView (NCColumnLayout)

-(NSArray*)arrayWithColumnLayout {
	NSTableView* tv = self;
	NSMutableArray* result = [NSMutableArray array];
	NSEnumerator* enumerator = [[tv tableColumns] objectEnumerator];
	NSTableColumn* column;
	while(column = [enumerator nextObject]) {
		NSNumber* v_width = [NSNumber numberWithFloat:[column width]];
		NSNumber* v_hidden = [NSNumber numberWithBool:[column isHidden]];
		NSString* v_identifier = [column identifier];
	    [result addObject:[NSDictionary dictionaryWithObjectsAndKeys:
			v_identifier, @"identifier",
			v_hidden, @"hidden",
			v_width, @"width",
			nil]];
	}
	return result;
}

-(void)adjustColumnLayoutForArray:(NSArray*)ary {
	NSTableView* tv = self;
	NSEnumerator* enumerator = [ary objectEnumerator];
	NSDictionary* dict;
	NSInteger column_index = 0;
	while(dict = [enumerator nextObject]) {
		NSString* v_identifier = [dict objectForKey:@"identifier"];
		float v_width = [[dict objectForKey:@"width"] floatValue];
		BOOL v_hidden = [[dict objectForKey:@"hidden"] boolValue];

		NSTableColumn* col = [tv tableColumnWithIdentifier:v_identifier];
		if(!col) continue;

		// Ensure proper column location
		NSInteger current_index = [tv columnWithIdentifier:v_identifier];
		NSInteger desired_index = column_index;
		[tv moveColumn:current_index toColumn:desired_index];
		
		// Adjust width and hidden flag
		NSUInteger mask = [col resizingMask];
		[col setResizingMask:0];
		[col setWidth:v_width];
		[col setHidden:v_hidden];
		[col setResizingMask:mask];

		column_index++;
	}
}

@end
