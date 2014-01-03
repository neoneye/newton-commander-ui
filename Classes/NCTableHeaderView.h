//
// NCTableHeaderView.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>

@protocol NCTableHeaderViewDelegate <NSObject>

-(NSMenu*)menuForHeaderEvent:(NSEvent*)event;

@end


@interface NCTableHeaderView : NSTableHeaderView
@property(unsafe_unretained) NSObject <NCTableHeaderViewDelegate> *delegate;

@end
