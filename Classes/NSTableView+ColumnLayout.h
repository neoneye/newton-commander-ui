//
// NSTableView+ColumnLayout.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>


@interface NSTableView (NCColumnLayout)

-(NSArray*)arrayWithColumnLayout;
-(void)adjustColumnLayoutForArray:(NSArray*)ary;

@end
