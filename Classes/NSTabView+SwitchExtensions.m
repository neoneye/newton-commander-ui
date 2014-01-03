//
// NSTabView+SwitchExtensions.m
// Newton Commander
//

#import "NSTabView+SwitchExtensions.h"


@implementation NSTabView (SwitchExtensions)

-(void)selectNextOrFirstTabViewItem:(id)sender {
	NSInteger n = [self numberOfTabViewItems];
	if(n < 1) return;
	
	NSInteger index = 0;
	NSTabViewItem* item = [self selectedTabViewItem];
	if(item) {
		index = [self indexOfTabViewItem:item];
		index++;
		if(index >= n) {
			index = 0;
		}
	}
	[self selectTabViewItemAtIndex:index];
}

-(void)selectPreviousOrLastTabViewItem:(id)sender {
	NSInteger n = [self numberOfTabViewItems];
	if(n < 1) return;
	
	NSInteger index = 0;
	NSTabViewItem* item = [self selectedTabViewItem];
	if(item) {
		index = [self indexOfTabViewItem:item];
		if(index > 0) {
			index--;
		} else {
			index = n - 1;
		}
	}
	[self selectTabViewItemAtIndex:index];
}

-(void)removeAllTabs:(id)sender {
	NSEnumerator* e = [[self tabViewItems] objectEnumerator];
	NSTabViewItem* item;
	while(item = [e nextObject]) {
		[self removeTabViewItem:item];
	}
}


@end
