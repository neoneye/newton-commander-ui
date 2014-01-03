//
// NCListerItem.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>
#import "NCFileItem.h"


@interface NCListerItem : NCFileItem {
	NSImage* m_icon;

}
@property (strong) NSImage* icon;

+(NCListerItem*)backItem;
+(NCListerItem*)listerItemFromFileItem:(NCFileItem*)item;

@end
